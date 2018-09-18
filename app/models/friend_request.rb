class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, foreign_key: 'friend_id', class_name: 'User'
  enum status: {pending: 0, accepted: 1 }
  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  validate :not_self
  
  
  private
  def not_self
    errors.add(:friend, 'self requested') if user == friend
  end
end
                      