class UsersController < ApplicationController
  skip_before_action :require_login, :except => [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      flash[:danger] = "Form is invalid"
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
