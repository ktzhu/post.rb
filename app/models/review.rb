class Review < ActiveRecord::Base
 validates_presence_of [:rating, :start, :end, :atmosphere, :skills, :duties, :eval] 
 belongs_to :job
 belongs_to :user
end
