class ArticlesController < ApplicationController
  def index #метод для отримання всіх статей
    @articles = Article.all
  end

  def show #метод для показу статей у представлені
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit #метод для обновлення статтей
    @article = Article.find(params[:id])
  end

  def create #метод для створення статтей
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update #метод для оновлення статтей
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy #метод для видалення статтей
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end