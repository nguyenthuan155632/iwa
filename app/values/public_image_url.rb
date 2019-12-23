# frozen_string_literal: true

class PublicImageUrl
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::AssetUrlHelper

  URL_OPTIONS = Settings.routes.url_options.to_h

  class << self
    def call(public_image)
      new(public_image).call
    end
  end

  def initialize(public_image)
    @public_image = public_image
  end

  def call
    return unless public_image

    public_image_url(public_image.uuid, URL_OPTIONS)
  end

  private

  attr_reader :public_image
end
