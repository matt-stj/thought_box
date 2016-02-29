class UsersController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to links_path
      flash[:success] = "Logged in as #{@user.email}"
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
