class Image < ApplicationRecord

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :post
  belongs_to :user
  has_many :like
  has_many :comment
end
