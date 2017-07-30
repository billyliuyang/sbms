class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery with: :exception
  before_filter :set_user

  def set_user
  	if session[:user_id]
  		@user = User.find_by(id: session[:user_id])
  	end
  end
end
