class Image < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_attached_file :file, styles: { medium: "400x400>"}, default_url: "bill4real.jpg"
  validates :title, presence: true
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
