class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit; end

  def update
    if Current.user.update(passsword_params)
      flash[:success] = '🔐 Password updated ✅'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def passsword_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
