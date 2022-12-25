class PasswordMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    # Here we are receiving the user params from the controller (password_resets_controller.rb), in this case is just an email
    # We are creating a token base on the user and we also signe_id it with a purpose and expiration time
    @token = params[:user].signed_id(purpose: 'password_reset', expires_in: 15.minutes)

    # Here we sending the email to the user with the token
    mail to: params[:user].email
  end
end
