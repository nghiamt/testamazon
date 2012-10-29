class CategoryController < ApplicationController
 skip_before_filter :authorize_admin
  def book
      @products = Product.all
  end

  def phone
      @products = Product.all
  end

  def computer
      @products = Product.all
  end
end
