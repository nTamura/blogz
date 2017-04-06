class CommentsController < ApplicationController
  def create
  @post = Post.find(params[:post_id])
  comment_params = params.require(:comment).permit(:body)
  @comment = Comment.new(comment_params)
  @comment.post = @post

  # @comment = @question.comments.build(comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment posted!'
    else
      redirect_to post_path(@post), alert: "Failed to create post"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post), notice: "Comment deleted!"
  end
end
