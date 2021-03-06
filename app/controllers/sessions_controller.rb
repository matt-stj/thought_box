class SessionsController < ApplicationController
  skip_before_filter :require_login


  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash[:notice] = 'Invalid Login'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Thanks for visiting."
    redirect_to '/'
  end
end
