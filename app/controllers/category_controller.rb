class CategoryController < ApplicationController

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
