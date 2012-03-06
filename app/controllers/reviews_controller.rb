class ReviewsController < ApplicationController
  def index
    @reviews = Review.find
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @job = Job.find(params[:job_id])
    @review = Review.new(params[:review])
    # @review.job = @job
    if @review.save
      redirect_to(job_url(@job), :notice => "Successfully submitted job review.")
    else
      render :action => "new"
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      redirect_to(@review, :notice => "Review successfully updated!")
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to(admin_url)
  end
end
