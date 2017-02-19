class AddCouponToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :coupon, :string
  end
end
