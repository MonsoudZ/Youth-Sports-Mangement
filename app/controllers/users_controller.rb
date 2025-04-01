class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.order(:first_name)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, roles: [])
  end

  def require_admin
    unless current_user.has_role?('admin')
      redirect_to root_path, alert: 'You are not authorized to access this area.'
    end
  end
end 