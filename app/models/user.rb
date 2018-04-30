class User < ActiveRecord::Base
  has_many :categories
  has_many :users, through: :categories
  has_secure_password
end
