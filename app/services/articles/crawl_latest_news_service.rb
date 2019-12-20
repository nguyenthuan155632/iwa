# frozen_string_literal: true

require 'open-uri'

class Articles::CrawlLatestNewsService < Patterns::Service
  BASE_URL = 'https://news.ycombinator.com/best'

  def initialize(page_number)
    @page_number = page_number
  end

  def call
    byebug
  end

  private

  attr_reader :page_number

  def url_with_page
    "#{BASE_URL}/"
  end
end
