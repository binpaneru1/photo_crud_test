class FriendRequest < ApplicationRecord


  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  validate :not_self
  
  def accept
    user.friends << friend
    destroy
  end

  def update
    @friend_request.accept
    head :no_content
  end

  private
  def not_self
    errors.add(:friend, 'self requested') if user == friend
  end
end
                      