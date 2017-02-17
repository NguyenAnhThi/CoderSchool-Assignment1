class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :food_item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
