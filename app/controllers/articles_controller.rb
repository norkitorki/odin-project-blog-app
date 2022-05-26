class ArticlesController < ApplicationController
  before_action -> { @article = Article.find(params[:id]) }, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with name: 'admin', password: 'password123', except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    update_tags
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    update_tags
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path, status: :see_other
  end

  private

  def update_tags
    @article.tags.clear
    article_params[:article_tags].split(",").uniq.each do |n|
      n.strip!
      @article.tags << (Tag.any? { |t| t.name == n } ? Tag.where(name: n) : Tag.create(name: n))
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :status, :article_tags)
  end
end
