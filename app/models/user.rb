class User < ActiveRecord::Base
  attr_accessible :daily_hours, 
                  :email,
                  :email_confirmation,
                  :first_name, 
                  :last_name, 
                  :password,
                  :password_confirmation,
                  :username
  
  validates :username,  presence: true, 
                        uniqueness: true, 
                        length: { in: 4..12 }
  validates :email, presence: true, 
                    uniqueness: true,
                    confirmation: true
  validates :email_confirmation, presence: true
  validates :password, presence: true,
                       length: { in: 4..12 },
                       confirmation: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :daily_hours, presence: true,
                          numericality: {
                            greater_than: 0.0
                          }
end
