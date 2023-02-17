# frozen_string_literal: true

# Main OmniauthCallbacksController class
class OmniauthCallbacksController < ApplicationController
  def twitter
    render plain: 'Success!'
  end
end
