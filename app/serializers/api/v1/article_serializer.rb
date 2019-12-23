# frozen_string_literal: true

class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :subtitle, :url, :cover_image_url, :thumbnail_image_url

  def cover_image_url
    PublicImageUrl.call(object.cover_public_image)
  end

  def thumbnail_image_url
    PublicImageUrl.call(object.thumbnail_public_image)
  end
end
