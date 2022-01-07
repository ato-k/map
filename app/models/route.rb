class Route < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  validates :user_id, presence: true
  
  has_many_attached :images

  def self.search(keyword)
    where(["name like? OR start like?", "%#{keyword}%", "%#{keyword}%"])
  end
end