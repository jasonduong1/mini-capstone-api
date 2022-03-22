class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: params[:tax],
      total: params[:total],
    )
    order.save
    render json: order.as_json
  end

  def show
    order = Order.find(params[:id])
    render json: order.as_json
  end

  def index
    if current_user
      @orders =current_user.orders
      render json: @orders.as_json
    else
      render json: [], status :unauthorized
  end

end
