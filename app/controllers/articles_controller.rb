class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @article = Article.all.where(is_submit: true)
  end
end
