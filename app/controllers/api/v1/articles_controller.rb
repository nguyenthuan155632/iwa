# frozen_string_literal: true

class Api::V1::ArticlesController < Api::V1::BaseController
  before_action :set_articles, only: %i[index]
  before_action :set_article, only: %i[show]

  def index
    render json: @articles, each_serializer: Api::V1::ArticlesSerializer
  end

  def show
    render json: @article, serializer: Api::V1::ArticleSerializer
  end

  private

  def set_articles
    @articles = Article.all
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
