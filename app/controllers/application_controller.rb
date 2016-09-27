class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #because this will likely be called often per request, we cache as an instance variable to make faster
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alter: "You do not have access" if current_user.nil?
  end
end
