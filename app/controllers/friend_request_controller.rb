class FriendRequestController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend_request, except: [:index, :create, :destroy]
  # before_action :friend_response

  def create
    friend = User.find(params[:id])
    @is_friend = FriendRequest.where(friend_id:friend.id ,user_id: current_user.id)
    if @is_friend.nil?
      redirect_back fallback_location: root_path , :flash => { :error => "Cannot send the friend request." }
    else
      @friend_request = current_user.friend_requests.new(friend: friend)
      @friend_request.status = 0
      if @friend_request.save
        redirect_back fallback_location: root_path , :flash => { :message => "Friend Request sucessfully sent" }
      else
       @errormessage = @friend_request.errors
       redirect_back fallback_location: root_path ,:flash => { :error => @friend_request.errors.messages[:friend].first }
      #render json: @friend_request.errors, status: :unprocessable_entity
      end
    end
  end

  def response
      @user = FriendRequest.find(params[:id])
      @user.update(status: 1)
      #return redirect_to friends_index_path
      #@user.update_attributes(:status => 1)
      redirect_back fallback_location: root_path
  end
  
  def decline
      binding.pry
  end

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def destroy
    if FriendRequest.find(params[:id]).destroy
      redirect_back fallback_location: root_path
    else
      redirect_back fallback_location: root_path ,:flash => { :error => "The friend request cannot be cancelled. Please try again" }
    end
  end

  # def update
  #   @friend_request.accept
  #   head :no_content
  # end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
