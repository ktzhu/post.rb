class CreateJobReviewJoinTable < ActiveRecord::Migration
  def change
    create_table :jobs_reviews, :id => false do |t|
      t.integer :job_id
      t.integer :review_id
    end
  end
end
