class Job < ActiveRecord::Base
  default_scope :order => "name"

  has_many :reviews, :dependent => :destroy
  accepts_nested_attributes_for :reviews, :reject_if => lambda { |a| a[:eval].blank? }, :allow_destroy => true
  has_and_belongs_to_many :users

  validates_presence_of [:name, :company]
  attr_accessible :name, :company, :reviews_attributes, :reviews
end
