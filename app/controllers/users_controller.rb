class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show, :new, :create, :following, :followers]

  def index
    @users = User.all

    if params[:random]
      n = @users.length
      rnd_idx = rand(0...n)
      user = @users[rnd_idx]
      redirect_to "/users/#{user.id}?random=true"
    end

    if current_user
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def show
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have signed up!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless session[:user_id] == @user.id
      flash[:notice] = "You don't have access to that account!"
      redirect_to users_path
      return
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to user_path(current_user.id)
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :bio, :email, :location, :image, :bannerimg, :password, :password_confirmation)
  end

end
