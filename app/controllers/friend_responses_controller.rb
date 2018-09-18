class FriendResponsesController < ApplicationController
  before_action :authenticate_user!

  def friend_res
    @user = FriendRequest.find(params[:id])
    @user.update(status: 1)
    #return redirect_to friends_index_path
    #@user.update_attributes(:status => 1)
    redirect_back fallback_location: root_path
  end

  def decline_request
      FriendRequest.find(params[:id]).destroy
      @div_id = params[:id]
  end
end
