class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]


  def home
    if current_user
      redirect_to cakes_path
    end
  end

  def dashboard
    @cakes = current_user.cakes
  end
end
