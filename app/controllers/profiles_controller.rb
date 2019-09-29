class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  before_action :authenticate_user!

  def edit
    @user = User.find_by(id: params[:user_id])
  end

  def update
    if @user.update(profile_params)
      flash[:success] = "Your profile updated"
      redirect_to edit_profile_path(@user.id)
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def profile_params
    params.require(:user).permit(:name, :email)
  end
end
