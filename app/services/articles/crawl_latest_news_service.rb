# frozen_string_literal: true

require 'open-uri'
require 'net/http'

class Articles::CrawlLatestNewsService < Patterns::Service
  BASE_URL = 'https://news.ycombinator.com/best'
  DUMMY_IMAGE = 'https://dummyimage.com/640x360/fff/aaa'

  def initialize(page_number)
    @page_number = page_number
  end

  def call # rubocop:disable Metrics/AbcSize, MethodLength
    ApplicationRecord.transaction do
      articles = document.search('table.itemlist tr.athing')
      articles.each do |article|
        url = article.search('td.title > a').attr('href').value
        next if !url_exist?(url) || Article.exists?(url: url)

        detail = crawl_article_detail(url)
        record = {
          title: article.search('td.title > a').text,
          description: article.next_element.text.remove(/\n/).strip,
          subtitle: article.search('td.title span.sitestr').text,
          url: url,
          content: detail[:content],
          cover_image_id: cover_public_image(detail[:cover_image_url]).id,
          thumbnail_image_id: thumbnail_public_image(detail[:cover_image_url]).id,
        }
        Article.create!(record)
      end
    end
  end

  private

  attr_reader :page_number

  def crawl_article_detail(article_url)
    ::Articles::CrawlNewsService.call(article_url).result
  end

  def url_with_page
    "#{BASE_URL}?p=#{page_number}"
  end

  def source
    URI.open(url_with_page).read
  end

  def document
    @document ||= Nokogiri::HTML(source)
  end

  def cover_public_image(cover_image_url)
    p_image = PublicImage.create!
    p_image.image.attach(io: URI.open(cover_image_url), filename: "cover_#{p_image.uuid}.jpg")
    p_image
  rescue StandardError
    dummy_image
  end

  def thumbnail_public_image(cover_image_url)
    p_image = PublicImage.create!
    thumbnail_image = ConvertToThumbnailService.call(cover_image_url).result
    p_image.image.attach(io: File.open(thumbnail_image), filename: "thumbnail_#{p_image.uuid}.jpg")
    p_image
  rescue StandardError
    dummy_image
  end

  def dummy_image
    @dummy_image ||= begin
                       p_image = PublicImage.create!
                       p_image.image.attach(io: URI.open(DUMMY_IMAGE), filename: "dummy_#{p_image.uuid}.jpg")
                       p_image
                     end
  end

  def url_exist?(url_string)
    url = URI.parse(url_string)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == 'https')
    path = url.path.present? ? url.path : nil
    res = req.request_head(path || '/')
    res.code != '404'
  rescue StandardError
    false
  end
end
