class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
