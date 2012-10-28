class Order < ActiveRecord::Base
  PAY_TYPES = ["Cash", "Credit Cart"]
  validates :name, :presence => true
  validates :address, :presence => true
  validates :pay_type, :presence => true, :inclusion => PAY_TYPES
  has_many :line_products, :dependent => :destroy
end
