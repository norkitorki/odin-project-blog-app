class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @articles = Article.all.select { |article| article.id == @tag.article_id }
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tag_path(@tag)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
