class Cart < ActiveRecord::Base
  has_many :line_products, :dependent => :destroy
  
  
  def add_product(product_id)
    current_product = line_products.find_by_product_id(product_id)
    if current_product
    current_product.quantity += 1
    else
      current_product = line_products.build(:product_id => product_id, :quantity => 1)
    end
    current_product
  end
  
  def total_price
    sum = 0;
    self.line_products.each do |p|
      sum += p.product.price * p.quantity
    end
    sum
  end

end
