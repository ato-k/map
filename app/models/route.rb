class Route < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  
  has_many_attached :images
end
