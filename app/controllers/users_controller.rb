class UsersController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create 
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id 
      flash[:success] = "Successfully Created User!"
      redirect_to '/contacts'
    else
      flash[:warning] = "Ivalid Email or Password"
      redirect_to '/signup'
    end
  end
end