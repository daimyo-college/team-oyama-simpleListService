class Item < ApplicationRecord
  belongs_to :list
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true, length: { maximum: 250 }
  validates :list_id, presence: true
end
