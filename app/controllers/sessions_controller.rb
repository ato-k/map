class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
    else
      flash.now[:alert] = "nameまたはpasswordが違います。"
      render 'new'
    end
  end

  def destroy
    forget(current_user)
    session[:user_id] = nil
    redirect_to root_path
  end
end