class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show]
  def new
    @post = Post.new
  end

  def home
    @posts_home = Post.all
    @users = User.all
  end

  def profile

    @comment = Comment.new
    @posts = User.find(params[:id]).posts
  end

  def index
    if user_signed_in?
    @posts = current_user.posts
    else 
      @posts = Post.all
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  def edit
      @post = Post.find(params[:id])
      #@post.update()
      #binding.pry
  end

  def update
   #binding.pry
    @post = Post.find(params[:id])
   Image.where(post_id: @post.id).delete_all
    if @post.update(permit_post)
      params[:image].each do |x|
        @img = Image.new(permit_image)
        @img.post_id = @post.id
        @img.image = x
        @img.save
      end
      flash[:success] = "Successfully updated"
      redirect_to post_path(@post)

    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
     end
    end

  def show
  end

  def create
    @post = Post.new(permit_post)
    #binding.pry
    @post.user_id = current_user.id
    @number = params[:image].length
    if @post.save
      params[:image].each do |x|
        @img = Image.new(permit_image)
        @img.post_id = @post.id
        @img.image = x
        @img.save
      end
      flash[:success] = " #{@number} images has been uploaded"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

#TO prevent sql injection, ensures user can only edit image and descriptions only.  
  private
    def set_post
      @post = Post.find(params[:id])
    end

    def permit_post
       params.require(:post).permit(:description,:title)
    end

    def permit_image
      params.require(:post).permit(:image)
    end
end
