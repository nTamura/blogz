class WelcomeController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.last(12)
    @post = Post.new
    @featured_post = Post.last
    # @your_post = want this to be your last post
  end

  def create
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit([:title, :body])
  end

  def find_post
    @post = Post.find params[:id]
  end

end
