class UsersController < ApplicationController
  def sign_in
    @user = User.new
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # redirect_to posts_path
  end
  
  def index
    @user = User.order()
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
