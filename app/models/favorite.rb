class Favorite < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
 
  # validates = データが正しいか確かめる　precence　=中身が空か
  validates :micropost_id, presence: true
  validates :user_id, presence: true
end
