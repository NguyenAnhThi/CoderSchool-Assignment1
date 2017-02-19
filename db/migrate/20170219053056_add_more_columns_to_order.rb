class AddMoreColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :customer_name, :string
    add_column :orders, :phone_number, :string
    add_column :orders, :address, :string
    add_column :orders, :delivery, :boolean
  end
end
