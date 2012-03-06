class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :company
      t.integer :rating, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
