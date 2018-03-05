module SessionsHelper
  def log_in(user)
    session[:user_id] = user.name
  end

  def current_user
    @current_user ||= User.find_by(name: session[:user_id])
  end

  def log_out
    session[:user_id] = nil
  end
end
