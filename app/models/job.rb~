class Job < ActiveRecord::Base
  default_scope :order => "name"

  has_many :reviews
  has_and_belongs_to_many :users

  validates_presence_of [:name, :company, :rating]
end
