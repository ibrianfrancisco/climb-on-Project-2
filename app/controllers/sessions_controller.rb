class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash.now.alert = 'Invalid login - try again!'
      render :index
                                                                                 # Find a way to render users/index view. or root_path instead of sessions. everytime, i refresh on sessions, error.
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
