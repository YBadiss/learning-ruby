class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    session = params[:session]
    user = User.find(session[:name])

    if user && user.authenticate(session[:password])
      log_in user
      redirect_to root_url
    else
      flash[:danger] = 'Invalid email/password combination'
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
