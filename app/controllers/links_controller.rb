class LinksController < ApplicationController

  def new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "Link #{@link.title} created"
    else
      flash.now[:error] = @link.errors.full_messages.to_sentence
    end
    redirect_to links_path
  end

  def index
    @links = current_user.links
  end


    private

    def link_params
      params.require(:link).permit(:link_url, :title, :user_id)
    end

end
