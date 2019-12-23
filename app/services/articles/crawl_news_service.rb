# frozen_string_literal: true

require 'open-uri'

class Articles::CrawlNewsService < Patterns::Service
  DUMMY_IMAGE = 'https://dummyimage.com/640x360/fff/aaa'

  def initialize(url)
    @url = url
    @uri = URI(url)
  end

  def call
    { content: readability_document.content,
      cover_image_url: cover_image }
  end

  private

  attr_reader :url, :uri

  def source
    URI.open(url).read
  end

  def readability_document
    @readability_document ||= Readability::Document.new(source)
  end

  def nokogiri_document
    @nokogiri_document ||= Nokogiri::HTML(source)
  end

  def cover_image # rubocop:disable Metrics/MethodLength
    case best_image
    when /^http/
      best_image
    when nil
      DUMMY_IMAGE
    when %r{^\/}
      base_url + best_image
    when %r{^\.\/}
      base_url + best_image.remove(/^\./)
    else
      url + best_image
    end
  end

  def base_url
    "#{uri.scheme}://#{uri.host}"
  end

  # TODO: alternate by a better algorithm later
  def best_image
    @best_image ||= nokogiri_document.xpath('//img[@src]')
                                     .inject([]) { |uris, node| uris << node.attr('src').strip }
                                     .uniq[0]
  end
end

# ::Articles::CrawlNewsService.call('https://luaradio.io/new-to-sdr.html')
