class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show, :new, :create]
  def index
    @users = User.all
  end

  def show
    @posts = @user.posts
    @userid = @user.id
    # @user = User.find(params[:])
    # @posts = current_user.posts
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
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :bio, :email, :location, :password, :password_confirmation)
  end
end

# def destroy
#   @hack = Hack.find(params[:id])
#   @hack.destroy if @hack.user == current_user
#   redirect_to Disneyland
# end

# basically this is how you make sure that only the person that is currently logged in can destroy their own acct and not others.
