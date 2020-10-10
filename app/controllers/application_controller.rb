class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  #Force signout to prevent CSRF attakcs
  def handle_unverified_request
    sign_out
    super
  end
end
