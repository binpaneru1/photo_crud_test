class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :friend_response

  protected

  def friend_response
    @requests = FriendRequest.where(friend_id:current_user, status:0)
    until @requests.empty?
       return
     end
  end


 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   #devise_parameter_sanitizer.for(:account_update) << :name
 end
 
end
