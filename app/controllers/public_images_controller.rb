# frozen_string_literal: true

class PublicImagesController < ApplicationController
  def show
    image = PublicImage.find_by(uuid: params[:uuid])&.image
    raise ActionController::RoutingError unless image&.attached?

    send_data image.download, filename: image.filename.to_s, type: image.content_type, disposition: 'inline'
  end
end
