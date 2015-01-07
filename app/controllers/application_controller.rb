class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
#  layout "admin"
  layout :determine_layout
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Shows different layout to logged in users
  def determine_layout
    current_user ? "admin" : "login"
  end
end