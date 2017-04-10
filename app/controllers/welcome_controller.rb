class WelcomeController < ApplicationController

  def new
    @post = Posts.new
  end

  def index
    @posts = Posts.last(12)
    @post = Posts.new
    @featured_post = Posts.last
  end

  def create
    @post = Posts.new
  end


  private

    def post_params
      params.require(:post).permit([:title, :body])
    end

    def find_post
      @post = Posts.find params[:id]
    end
end
