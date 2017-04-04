class BlogController < ApplicationController

  def index
    @posts = Post.last(90)
    @post = Post.new
    @featured_post = Post.last

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
    params.require(:post).permit(:title, :body))
    if @post.save
      # redirect_to  product_path(@product)
      redirect_to :index
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit([:title, :body])
  end

    def find_post
      @post = Post.find params[:id]
    end

end
