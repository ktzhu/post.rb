class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  include SessionsHelper
  
  protected
    def authorize
      # unless User.find(session[:user_id])
      unless session[:user_id] 
          redirect_to login_url, :notice => "Please log in!"
      end
    end
end
