class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.date :start
      t.date :end
      t.text :atmosphere
      t.text :skills
      t.text :duties
      t.text :eval
      
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
