class SessionsController < ApplicationController
  layout "login"

  def new
  end

  def destroy
  end

  def frontpage
    render :layout => 'alternative'
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: "Logged In!"
    else
      flash.now[:alert] = "Invalid email or password!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  def view
  end

end
