class SessionsController < ApplicationController

  @current_user = @current_user || User.find_by(id: session[:user_id])

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
      # Log the user in and redirect to the homepage.
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
  end
end
