class User < ActiveRecord::Base
  has_many :categories
  has_many :recipes, through: :categories
  has_secure_password
end
