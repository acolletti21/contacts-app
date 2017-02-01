class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    #this is an alternate way of writing this as an if/else statement. so it sets @current_user to be the user who's logged in if their session is currently active. If there's already a current user, it won't need to reset because @current user will equal true and won't go through the ||. 
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end
end
