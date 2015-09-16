class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Thank you for signing in!'
      log_in user
      redirect_to root_path  
    else
      flash.now[:error] = 'Incorrect email or password'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end