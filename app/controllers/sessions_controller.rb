class SessionsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid login - try again!'
      render :index
                                                                                 # Find a way to render users/index view. or root_path instead of sessions. everytime, i refresh on sessions, error.
    end
  end

  def edit
  end

  def update
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def set_user
  end

  def user_params
  end
end
