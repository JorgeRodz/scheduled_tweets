class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # NOTE: 'params[:user]' is a hash of the user's form data
    # render plain: params[:user] # This will print the hash to the screen just as a example to see what is in the hash

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Successfully created account'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  # strong params: whitelist of allowed form fields
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
