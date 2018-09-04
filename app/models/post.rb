class Post < ApplicationRecord

  belongs_to :user
  has_many :images , dependent: :destroy
  has_many :comments , dependent: :destroy
end
