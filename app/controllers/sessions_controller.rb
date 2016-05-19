class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
      # Log the user in and redirect to the homepage.
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? #for error checking
    redirect_to root_path
  end
end
