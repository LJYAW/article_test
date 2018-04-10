class ArticlesController < ApplicationController
  def index

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    binding.pry
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def article_params
    params.require(:article).permit(:title, :short_title, :content, :is_submit,
                                    :keywords, :is_choose, :description)
  end

end
