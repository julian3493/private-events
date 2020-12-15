class SessionsController < ApplicationController
  def create
    @user = User.find_by_name(params[:name])
    if @user
      session[:user_id] = @user.id
      session[:name] = @user.name
      redirect_to root_path
      flash.notice = 'Logged in!'
    else
      flash.alert = 'Invalid user name'
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:name)
    session.delete(:user_id)
    session[:user_id] = nil
    redirect_to root_path
    flash.notice = 'Logged out!'
  end
end
