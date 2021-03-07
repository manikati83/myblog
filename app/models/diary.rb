class Diary < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  validates :content, presence: true, length: { maximum: 1000 }
  validates :title, presence: true, length: { maximum: 250 }
end
