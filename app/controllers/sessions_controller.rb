class SessionsController < ApplicationController
	skip_before_filter :authorize
	
	def new
	end

	def create
		if user = User.authenticate(params[:name], params[:password])
			session[:user_id] = user.id.to_s
                        sign_in user
			redirect_to jobs_url
		else
			redirect_to login_url, :alert => "Username and password do not match."
		end
	end

	def destroy
		session[:user_id] = nil
                sign_out
		redirect_to jobs_url, :notice => "You've successfully logged out."
	end
end
