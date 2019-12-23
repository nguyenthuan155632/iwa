# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :cover_public_image,
             class_name: 'PublicImage',
             foreign_key: :cover_image_id,
             inverse_of: false,
             optional: true
  belongs_to :thumbnail_public_image,
             class_name: 'PublicImage',
             foreign_key: :thumbnail_image_id,
             inverse_of: false,
             optional: true

  validates :cover_public_image, presence: true, if: :validate_cover_image_presence?
  validates :thumbnail_public_image, presence: true, if: :validate_thumbnail_image_presence?

  private

  def validate_cover_image_presence?
    new_record? || cover_image_id_changed?
  end

  def validate_thumbnail_image_presence?
    new_record? || thumbnail_image_id_changed?
  end
end
