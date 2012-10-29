class CategoryController < ApplicationController
 skip_before_filter :authorize_admin
  def book
      @products = Product.paginate :page=>params[:page], :order=>'title',:per_page => 10
  end

  def phone
       @products = Product.paginate :page=>params[:page], :order=>'title',:per_page => 10
  end

  def computer
      @products = Product.paginate :page=>params[:page], :order=>'title',:per_page => 10
  end
end
