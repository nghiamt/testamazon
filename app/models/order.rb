class Order < ActiveRecord::Base
  PAY_TYPES = ["Cash", "Credit Cart"]
  validates :name, :presence => true
  validates :address, :presence => true
  validates :pay_type, :presence => true, :inclusion => PAY_TYPES
  has_many :line_products, :dependent => :destroy
  
   def total_price
    sum = 0;
    self.line_products.each do |p|
      sum += p.product.price * p.quantity
    end
    sum
  end
end
