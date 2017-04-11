class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # before_action :authenticate_user!
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User created and signed in!"
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong!!"
      render :new
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
