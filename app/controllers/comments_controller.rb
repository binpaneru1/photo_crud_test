class CommentsController < ApplicationController
  respond_to :html , :js
  def new
    @comment = Comment.new
  end

  def index
    #@comments = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #@comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(permit_comment)
      flash[:success] = "Comment sucessfully updated"
      redirect_back fallback_location: root_path
    else
      flash[:error] = @comment.errors.full_messages
      redirect_back fallback_location: root_path
    end
  end

  def show

  end

  def create
    @comment = Comment.new(permit_comment)
    @comment.user_id = current_user.id
    @comment.post_id = params[:comment][:post_id] 
    if @comment.save
      flash[:success] = "Comment posted"
       redirect_back fallback_location: root_path
    else
      flash[:error] = @comment.errors.full_messages
       redirect_back fallback_location: root_path
    end
  end
  private
  def permit_comment
    params.require(:comment).permit(:user_id,:post_id,:comment)
  end
end
