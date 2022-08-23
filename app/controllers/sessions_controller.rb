class SessionsController < ApplicationController
  def new 

  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # flash[:notice] = "Log In successfully"
      redirect_to expenses_path
    else
      # flash.now[:alert] = "Something is wrong!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    # flash[:notice] = "Log out successfully"
    redirect_to root_path
  end
end
