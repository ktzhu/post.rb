class JobsController < ApplicationController
  before_filter :authorize, :except => [:index, :home]

  def home
  end

  def review
  end

  def about
  end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    @reviews = Review.find_by_job_id(params[:id])
    @new_review = @job.reviews.build
  end

  def new
    @job = Job.new
    @job.reviews.build
    @reviews = Review.find_by_job_id(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(params[:job])

    if @job.save
      redirect_to(admin_url, :notice => "Successfully added job #{@job.name} at #{@job.company}.")

    else
      render :action => "new"
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      redirect_to(@job, :notice => "Job successfully updated!")
    else
      render :action => "edit"
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to(admin_url)
  end
end
