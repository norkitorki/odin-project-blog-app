class TagsController < ApplicationController
  before_action -> { @tag = Tag.find(params[:id]) }, only: [:show, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    remove_tag_from_articles
    @tag.destroy

    redirect_to tags_path, status: :see_other
  end

  private

  def remove_tag_from_articles
    @tag.articles.each { |article| article.tags.delete(@tag.id) }
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
