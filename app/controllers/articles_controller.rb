class ArticlesController < ApplicationController
  def index
    @articles = params[:q].nil? ? Article.all : Article.search(params[:q])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit :title, :text
  end
end
