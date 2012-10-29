class ApplicationController < ActionController::Base
  before_filter :authorize_admin
  protect_from_forgery

  protected

  def authorize_admin
    user = User.find_by_id(session[:user_id])
    if user == nil
      redirect_to login_url, :notice => "Please log in as a admin"
    else
      unless user.is_admin
      redirect_to login_url, :notice => "Please log in as a admin"
      end
    end
  end

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
    end
end
