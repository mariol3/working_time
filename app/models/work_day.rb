class WorkDay < ActiveRecord::Base
  attr_accessible :date, :work_hours
  
  validates :work_hours,  presence: true,
                          numericality: {
                            greater_than_or_equal_to: 0.0
                          }
  validates :date, presence: true, uniqueness: true
end
