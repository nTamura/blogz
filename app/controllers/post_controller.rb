class PostController < ApplicationController

    before_action :authenticate_user!, except: [:show, :index]
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.last(12)
      @post = Post.new
      @featured_post = Post.first

    end

    def show
      @post = Post.find(params[:id])
      @users = User.all
      @comment = Comment.new
      @comments = Comment.all
    end

    def new
      @post = Post.new
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

    def destroy
      if can? :destroy, @post
        @post.destroy
        redirect_to posts_path, notice: 'Post Deleted'
      else
        redirect_to root_path, alert: 'Access denied'
      end
    end

  private
    def post_params
      params.require(:post).permit([:title, :body])
    end

      def find_post
        @post = Post.find params[:id]
      end

  end
