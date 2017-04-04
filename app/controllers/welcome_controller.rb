class WelcomeController < ApplicationController
  def index
    @post = Post.last(90)
    @post = Post.new
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
    params.require(:post).permit(:title, :body))
    if @post.save
      # redirect_to  product_path(@product)
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    

  end

private
  def post_params
    params.require(:question).permit([:title, :body])
  end

    def find_post
      @post = Post.find params[:id]
    end

end
