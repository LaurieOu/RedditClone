class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def log_in!(user)
    session[:session_token] = user.reset_session_token
  end

  def log_out
    session[:session_token] = nil
  end
  
  def current_user
    User.find_by_session_token(session[:session_token])
  end


end
