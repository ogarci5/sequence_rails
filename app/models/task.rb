class Task < ActiveRecord::Base
  belongs_to :project
  attr_accessible :completed, :description, :difficulty, :name, :status, :time_estimate, :time_spent
end
