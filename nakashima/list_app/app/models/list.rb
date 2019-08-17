class List < ApplicationRecord
  belongs_to :user
  has_many :items
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true

  
end
