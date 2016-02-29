class Api::V1::LinksController < ApplicationController
  skip_before_filter :require_login
  respond_to :json

  def index
    respond_with Link.all
  end

  def show
    @user = User.find(params[:id])
    respond_with @user.links
  end


end
