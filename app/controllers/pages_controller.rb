class PagesController < ApplicationController


  def home
    if current_user
      redirect_to cakes_path
    end
  end
end
