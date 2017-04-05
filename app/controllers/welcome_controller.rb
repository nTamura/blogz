class WelcomeController < ApplicationController
  def new
  end

  def index
    @featured_post = Post.last
  end

  def create
  end

end
