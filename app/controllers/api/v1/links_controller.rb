class Api::V1::LinksController < ApplicationController
  skip_before_filter :require_login
  respond_to :json

  def index
    respond_with current_user.links
  end

end
