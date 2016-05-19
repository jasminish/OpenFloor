class WelcomeController < ApplicationController
  def index
    if logged_in?
      render 'welcome/index'
    else
      redirect_to login_path
    end
  end


end
