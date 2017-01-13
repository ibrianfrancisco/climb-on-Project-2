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
    @createpost = User.find(session[:user_id])
    @createpost.posts.create(post_params)
    if @createpost.save
      redirect_to @createpost, notice: "Your post has been saved."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :keyword)
  end
end
