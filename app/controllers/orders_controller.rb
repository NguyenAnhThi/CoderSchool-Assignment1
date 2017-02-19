class OrdersController < ApplicationController
  def new
    @item = FoodItem.find(params[:food_item_id])
    # @order = Order.new(food_item: @item)
    @order = @item.orders.build
  end

  def show
    @food_item = FoodItem.find(params[:food_item_id])
    @order = @food_item.orders.find(params[:id])
    @date_time = DateTime.parse(@order.created_at.to_s)
    @total = @food_item.price * @order.quantity
    if @order.coupon.eql? "CODERSCHOOL"
      @total = @total / 2
    end
    @total = @total + (@order.delivery ? 1 : 0)
  end

  def create
    @item = FoodItem.find(params[:food_item_id])
    @order = @item.orders.build order_params

    if @order.save
      redirect_to food_item_order_path(params[:food_item_id], @order.id), flash: {success: "Thank you for your order!"}
    else
      render 'new'
    end
  end

  def index
    @food_item = FoodItem.find(params[:food_item_id])
    @orders = @food_item.orders.all
  end

  def order_params
    params.require(:order).permit(:quantity, :customer_name, :phone_number, :address, :delivery, :coupon)
  end
end
