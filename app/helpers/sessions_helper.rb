module SessionsHelper
  def current_user
    @currnet_user ||=User.find_bu(id: session[:user_id])
  end
  
  def logged_in?
    !!currnet_user
  end
end
