class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    product = Product.find(params[:product_id])

    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    @order.save
    render :show
  end

  def show
    @order = Order.find(params[:id])
    render :show
  end

  def index
    @orders = Order.all
    render :index
  end
end
