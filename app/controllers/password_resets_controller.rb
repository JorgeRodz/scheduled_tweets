class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    # Send email
    # We can use deliver_now or deliver_later . deliver_later is to most used one on production but in this case we will use deliver_now because we are not using a background job
    # mailerName  .params to mailer .method to call(reset)
    PasswordMailer.with(user: @user).reset.deliver_now if @user.present?

    flash[:notice] =
      'ℹ️ If an account with that email is found, we will send a link to reset your password.'
    redirect_to root_path
  end

  def edit
    # Here we are finding the user by the token and we are also checking if the token is valid
    # The method 'find_signed!' will raise an error if the token is invalid
    # This @user instance variable will be available in the view
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature # if the token is invalid we will redirect to the sign in page
    flash[:alert] = '🤷🏻‍♂️ Your token has expired. Please try again.'
    redirect_to sign_in_path
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      flash[:success] = '🔐 Your password has been reset ✅'
      redirect_to sign_in_path
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
