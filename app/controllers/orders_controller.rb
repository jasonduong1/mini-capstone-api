class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @order = Order.new(
      user_id: current_user.id,
    )
    @order.save
    carted_products = current_user.carted_products.where(status: "carted")
    @order.update_totals
    carted_products.update_all(status: "purchased", order_id: @order.id)
    render :show
  end
end
