class SessionsController < ApplicationController
  skip_before_filter :authorize_admin
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      if user.is_admin?
        redirect_to admin_url
      else
        redirect_to root_url
      end
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    Cart.destroy(session[:cart_id])
    session[:user_id] = nil
    session[:cart_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end
