class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: nil,
      status: "carted",
    )
    carted_product.save
    render json: carted_product
  end

  def index
    carted_products = current_user.carted_products
    render json: carted_products
  end
end
