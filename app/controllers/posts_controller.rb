class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Posts.last(12)
    @post = Posts.new
    @featured_post = Posts.first
  end

  def show
    @posts = Posts.find(params[:id])
    @users = User.all
    @comment = Comment.new
    @comments = Comment.all
  end

  def new
    redirect_to root_path, alert: 'Access denied!' unless can? :edit, @post
  end

  def create
    @post = Posts.new post_params
    @post.user = current_user

    if @post.save
      redirect_to post_path(@post)
      # redirect_to :index
    else
      render :new
    end
  end

  def edit
    redirect_to root_path, alert: 'Access denied!' unless can? :edit, @post
  end

  def update
    if !(can? :edit, @post)
      redirect_to root_path, alert: 'Access denied'
    elsif @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post updated'
    else
    render :edit
    end
  end


  def destroy
    if can? :destroy, @post
      @post.destroy
      redirect_to post_index_path, notice: 'Post Deleted'
    else
      redirect_to root_path, alert: 'Access denied'
    end
  end

  private

    def post_params
      params.require(:post).permit([:title, :body])
    end

    def find_post
      @post = Posts.find params[:id]
    end
  end
