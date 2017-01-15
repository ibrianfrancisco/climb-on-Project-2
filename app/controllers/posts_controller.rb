class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @comment = @post.comments.new
    @comment.post = @post
    @comments = @post.comments
  end

 def new
    @post = Post.new
  end

  def create
    @createpost = User.find(session[:user_id])
    @createpost.posts.create(post_params)
    if @createpost.save
      redirect_to @createpost, notice: "Your post has been saved."
    else
      render :new
    end
  end

  def edit
    unless current_user == @post.user
      flash[:notice] = "Sorry, can't let you do that."
      redirect_to users_path
      return
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to user_path(current_user.id), notice: "Your post has been saved."
    else
      render :edit
    end
  end

  def destroy
    unless current_user == @post.user
      flash[:notice] = "Sorry, can't let you do that."
      redirect_to users_path
      return
    end
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :keyword, :image)
  end
end
