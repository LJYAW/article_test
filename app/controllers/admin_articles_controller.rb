class AdminArticlesController < ApplicationController
  # before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_content_params, only: [:new, :edit, :create]
  def index
    @articles = Article.all.filter(params)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "已更新完毕"
    else
      flash[:error] = "更新失败，查看必填项是否填写"
    end
    redirect_to admin_articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy!
    redirect_to admin_articles_path
  end

  def article_params
    params.require(:article).permit(:title, :short_title, :content, :is_submit,
                                    :keywords, :is_choose, :description)
  end

  def set_content_params
    @content_params = 'article[content]'
  end

  def filter_params
    params.permit(:category, :is_publish, :chosen, :article_type,
                  :create_start_date, :create_end_date)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
