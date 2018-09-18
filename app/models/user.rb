class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :friend_requests, dependent: :destroy
 



  #This method tries to find an existing user by the provider and uid fields
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    #user.name = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end


 # def self.from_omniauth(access_token)
    #data = access_token.info
    #user.email = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
     #unless user
       #  user = User.create(name: data['name'],
        #    email: data['email'],
         #   password: Devise.friendly_token[0,20]
         #)
     #end
    #user
#end

# to reset and confirm email
def send_devise_notification(notification, *args)
 devise_mailer.send(notification, self, *args).deliver_later
end
  # to copy data from session whenever a user is initialized before sign up, we just need to implement new_with_session in our model
  #def self.new_with_session(params, session)
    #super.tap do |user|
     # if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      #  user.email = data["email"] if user.email.blank?
      #end
    #end
  #end

  

  def accepted_user
    self.friend_requests.where(status: :accepted).pluck(:friend_id)
  end

  def requested_user
    self.friend_requests.where(status: :pending).pluck(:friend_id)
  end

  def get_users
    a = accepted_user
    a << requested_user
    a << self.id
    a.flatten!
    User.where.not(id: a) 
  end
end
