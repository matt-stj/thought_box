class Api::V1::LinksController < ApplicationController
  skip_before_filter :require_login
  respond_to :json

  def index
    respond_with current_user.links
  end

  def update
    respond_with Link.update(params[:id], link_params)
  end


  private

  def link_params
    params.require(:link).permit(:link_url, :title, :user_id, :read)
  end

end
