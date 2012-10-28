class Product < ActiveRecord::Base
  default_scope :order => 'title'
  TYPES = ["Book", "Computer", "Smart Phone"]
  validates :title, :presence => true, :uniqueness => true
  validates :info, :presence => true
  validates :price, :numericality =>{:greater_than_or_equal_to => 0.01}
  validates :category, :presence => true, :inclusion => TYPES
  validates :image, :format => {:with => %r{\.(gif|jpg|png)$}i,
                                :message => 'must be a URL for GIF, JPG or PNG image.'}
  has_many :line_product
  before_destroy :not_in_any_line_product
  
  private
  
  def not_in_any_line_product
    if self.line_products.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
