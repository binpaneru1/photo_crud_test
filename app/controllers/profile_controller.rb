class ProfileController < ApplicationController
   before_action :authenticate_user!
  def friends
    @friends = FriendRequest.where(friend_id:params[:id]).or(FriendRequest.where( user_id:params[:id]))  
  end

  def images
    @images = User.find(params[:id]).images
  end
end
