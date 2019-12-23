# frozen_string_literal: true

class PublicImage < ApplicationRecord
  has_one_attached :image

  attribute :uuid, :string, default: -> { SecureRandom.uuid }
end
