class HomeController < ApplicationController
  skip_before_filter :authorize_admin
  def index
    @products = Product.paginate :page=>params[:page], :order=>'title',:per_page => 5
    @cart = current_cart
  end
end
