class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :redirect_unless_admin!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def deactivate
    binding.pry
    user = User.find(params[:user_id])
    if current_user.is_admin?
      user.deactivate_account!
      redirect_to admin_users_path
    else
      redirect_to :back
    end
  end

  def activate
    binding.pry
    user = User.find(params[:user_id])
    if current_user.is_admin?
      user.activate_account!
      redirect_to admin_users_path
    else
      redirect_to :back
    end
  end

  def update
    binding.pry
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end

  private

  def user_params
     params.require(:user).permit(:active)
  end

end
