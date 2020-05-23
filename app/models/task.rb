class Task < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 30}
  validates :content, presence: true, length: { maximum: 300 }
end
