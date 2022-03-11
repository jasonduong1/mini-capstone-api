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

  def create
    product = Product.create(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    render json: product.as_json
  end
end
