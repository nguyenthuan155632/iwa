# frozen_string_literal: true

class Api::V1::ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :subtitle, :url
end
