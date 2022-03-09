class ProductsController < ApplicationController
  def all_products
    products = Product.all
    render json: products.as_json
  end

  def one_products
    product = Product.first
    render json: product.as_json
  end
end
