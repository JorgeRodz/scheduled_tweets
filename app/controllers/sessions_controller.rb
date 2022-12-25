class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    # 'authenticate' is a method provided by 'has_secure_password
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = '🏡 ← 🚶🏻 Logged in ✅'
      redirect_to root_path
    else
      flash[:error] = '🚫 Invalid email or password'
      render :new
    end
    # byebug
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = '🚶🏻 ← 🏠 Logged out'
    redirect_to root_path
  end
end
