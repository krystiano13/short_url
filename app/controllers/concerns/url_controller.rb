class UrlController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: :count
  def new
    @url = Url.new
  end

  def show_all
    id = current_user.id
    @urls = Url.where(:user_id => id)
  end

  def show_one
    @url = Url.find_by(short: params[:key])
  end

  def count
    @url = Url.find_by(short: params[:key])

    if @url.present?
      @url.increment!(:visits)
      @url.save!
    end

    render :json => {:status => "success"}, status: :ok
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
      redirect_to url_show_all_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def get_params
    return params.require(:url).permit(:long)
  end
end