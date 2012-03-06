class UsersController < ApplicationController
        def favs
        end
        
	def index
		@users = User.all
	end
	
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to(users_url, :notice => "Boom. User #{@user.name} has been created.")
		else
			render :action => "new"
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to(users_url, :notice => "Boom. You've updated user #{@user.name}.")
		else
			render :action => "edit"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to(users_url)
	end
end
