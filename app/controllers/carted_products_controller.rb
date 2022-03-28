class CartedProductsController < ApplicationController
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
    carted_products = current_user.carted_products.where(status: "carted")
    render json: carted_products
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.destroy
    render json: { message: "Item removed." }
  end
end
