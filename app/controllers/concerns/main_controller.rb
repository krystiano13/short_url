class MainController < ApplicationController
  def index
    if user_signed_in?
      redirect_to url_show_all_path
    end
  end
end