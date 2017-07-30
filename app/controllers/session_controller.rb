class SessionController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user.try(:authenticate, params[:password])
  		session[:user_id] = user.id
      cookies.signed[:user_id] = user.id
  		redirect_to "/", flash: { success: "#{user.name} Welcome back! " }
  	else
  		redirect_to login_url, flash: { warning: "Invalid user/password combination" }
  	end
  end

  def destroy
  	session[:user_id] = nil
    cookies.delete :user_id
  	redirect_to "/", flash: { danger: "Log out" }
  end
end
