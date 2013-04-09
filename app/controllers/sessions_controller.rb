class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    
    if user and user.password == params[:password]
      session[:user_id] = user.id
      redirect_to work_days_url
    else
      redirect_to login_url, alert: 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "Logged out"
  end
end
