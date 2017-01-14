class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to root_path, alert: 'Not authorized - must be logged in!' if current_user.nil?
  end

  def signup
    redirect_to root_path, alert: 'Sign up to leave a comment!' if current_user.nil?
  end

end
