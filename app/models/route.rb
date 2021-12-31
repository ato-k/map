class Route < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  validates :content, presence: true
end
