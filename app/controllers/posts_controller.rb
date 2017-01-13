class PostsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

 def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @user.posts.create(post_params)
    redirect_to @user
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to user_path(@post.user_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :keyword)
  end
end
