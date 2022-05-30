class CommentsController < ApplicationController
  before_action :find_article

  http_basic_authenticate_with name: 'admin', password: 'password123', only: :destroy

  def create
    @comment = @article.comments.new(comment_params)

    if @comment.save
      redirect_to @article
    else
      render "articles/show", status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, status: 303
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
