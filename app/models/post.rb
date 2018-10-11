class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :body, presence: true
  belongs_to :user
end
