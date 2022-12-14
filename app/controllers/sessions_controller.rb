class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    # 'authenticate' is a method provided by 'has_secure_password
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'π‘ β πΆπ» Logged in β'
      redirect_to root_path
    else
      flash[:error] = 'π« Invalid email or password'
      render :new
    end
    # byebug
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'πΆπ» β π  Logged out'
    redirect_to root_path
  end
end
