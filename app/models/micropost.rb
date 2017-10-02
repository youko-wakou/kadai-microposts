class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :microposts
  # has_many :favorites
  # has_many :clipings, through: :favorites, source: :micropost
  # has_many :reverses_of_favorite, class_name: 'Micropost',foreign_key: 'micropost_id'
  # has_many :clipeds, through: :reverses_of_favorite, source: :micropost
  
  
  
  
end
