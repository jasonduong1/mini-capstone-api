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

  def update
    product_id = params[:id]
    product = Product.find(product_id)
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description
    product.save
    render json: product.as_json
  end

  def destroy
    product_id = params[:id]
    product = Product.find(product_id)
    product.destroy
    render json: { message: "Product destroyed!" }
  end
end
