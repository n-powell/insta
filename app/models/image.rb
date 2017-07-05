class Image < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :src, :title, presence: true
end
