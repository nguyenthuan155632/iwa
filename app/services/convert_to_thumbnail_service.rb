# frozen_string_literal: true

class ConvertToThumbnailService < Patterns::Service
  class Error < StandardError; end

  DEFAULT_RESOLUTION = '300x300'

  def initialize(file_url, resolution: DEFAULT_RESOLUTION)
    @file_url = file_url
    @resolution = resolution
  end

  def call
    convert!
    thumbnail_image
  end

  private

  attr_reader :file_url, :resolution

  def convert!
    MiniMagick::Tool::Convert.new do |converter|
      converter << file_url
      converter.resize(resolution)
      converter.format('jpg')
      converter << thumbnail_image
    end
  rescue MiniMagick::Error => e
    raise Error, 'Invalid format' if e.message.match?(/no decode delegate for this image format/)
  end

  def thumbnail_image
    @thumbnail_image ||= Tempfile.new(%w[thumbnail_image .jpg]).path
  end
end
