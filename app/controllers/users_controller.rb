class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      reder action: :index
    end
  end

  def update
    @user = User.find(params[:id])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path, notive: 'ログアウトしました'
  end

  private def user_params
    params[:user].permit(:name)
  end
end
