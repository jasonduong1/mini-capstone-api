class ProductsController < ApplicationController
  def all_products
    products = Product.all
    render json: products.as_json
  end

  def first_product
    product = Product.first
    render json: product.as_json
  end

  def which_product
    input = params[:number]
    product = Product.find(input)
    render json: product.as_json
  end
end
