class ApplicationController < ActionController::Base
  # before any actions on controllers we will run this method
  before_action :set_current_user

  def set_current_user
    # find vs find_by
    # find will raise an exception if the record is not found - and the app will crash
    # find_by will return nil if the record is not found - and the app will not crash
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # helper method to add restriction on controller actions
  def require_user_logged_in!
    return unless Current.user.nil? # return when Current.user is not nil

    flash[:alert] = 'You must be signed in to do that.'
    redirect_to sign_in_path
  end
end
