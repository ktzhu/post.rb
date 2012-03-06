class AdminController < ApplicationController
	def index
		@jobs = Job.all
		@total_jobs = Job.count
	end
end