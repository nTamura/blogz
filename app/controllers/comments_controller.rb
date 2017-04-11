class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      redirect_to posts_path(@post), notice: 'Comment posted!'
    else
      redirect_to posts_path(@post), alert: "Failed to create post"

    end
  end

  def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy
     if @comment.save
       redirect_to posts_path(@post), notice: "Comment deleted!"
     else
       render :index
     end
   end
  #  if can? :destroy, @post
  #    @post.destroy
  #    redirect_to posts_path, notice: 'Post deleted'
  #  else
  #  redirect_to root_path, alert: 'Access denied'
  #  end
 # end

  private

  def post_params
    params.require(:post).permit([:title, :body])
  end

  def find_post
    @post = Post.find params[:id]
  end

  def comment_params
    params.require(:comment).permit([:body])
  end

  def find_post
    @comment = Comment.find params[:id]
  end


end
