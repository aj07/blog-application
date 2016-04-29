class SessionsController < ApplicationController

  def new
  end
  def create
    session[:current_user_id] = @user.id
    user = User.find_by(email: params[:session][:email].downcase)
    p user
    if user && user.authenticate(params[:session][:password])
      # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to "/articles/new"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
  	log_out if logged_in?
  	redirect_to_root_url
  end
end
