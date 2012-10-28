class AddOrderIdToLineProduct < ActiveRecord::Migration
  def change
    add_column :line_products, :order_id, :integer

  end
end
