class UrlController < ApplicationController
  before_action :authenticate_user!
  def new
    @url = Url.new
  end

  def show_all
    id = current_user.id
    @urls = Url.where(:user_id => id)
  end

  def create
    require 'digest'
    @url = Url.new(get_params)

    short_url_id = Digest::SHA256.hexdigest(@url.long)
    key = short_url_id[0..6]

    @url.short = key
    @url.user_id = current_user.id
    @url.visits = 0

    if @url.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def get_params
    return params.require(:url).permit(:long)
  end
end