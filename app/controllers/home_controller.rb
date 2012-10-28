class HomeController < ApplicationController
  skip_before_filter :authorize, :authorize_admin
  def index
    @products = Product.all
    @cart = current_cart
  end
end
