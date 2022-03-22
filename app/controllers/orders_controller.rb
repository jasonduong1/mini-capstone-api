class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
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
    orders = Order.all
    render json: orders.as_json
  end
end
