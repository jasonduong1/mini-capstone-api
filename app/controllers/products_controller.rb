class ProductsController < ApplicationController
  #  def which_product
  #   input = params[:number]
  #   product = Product.find(input)
  #   render json: product.as_json
  # end

  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product_id = params[:id]
    product = Product.find(product_id)
    render json: product.as_json
  end
end
