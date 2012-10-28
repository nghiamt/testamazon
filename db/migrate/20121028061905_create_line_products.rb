class CreateLineProducts < ActiveRecord::Migration
  def change
    create_table :line_products do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity

      t.timestamps
    end
  end
end
