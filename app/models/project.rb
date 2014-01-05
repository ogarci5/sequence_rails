class Project < ActiveRecord::Base
  attr_accessible :description, :name, :stage
  has_many :tasks
end
