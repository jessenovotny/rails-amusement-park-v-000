class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login(user)
    session[:user_id] ||= user.id
  end

  def logged_in?
    true if session[:user_id]
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
