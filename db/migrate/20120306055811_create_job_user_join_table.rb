class CreateJobUserJoinTable < ActiveRecord::Migration
  def change
    create_table :jobs_users, :id => false do |t|
      t.integer :job_id
      t.integer :user_id
    end
  end
end
