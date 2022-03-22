class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    pp current_user
    @products = Product.all
    render :index
  end

  def show
    product_id = params[:id]
    @product = Product.find(product_id)
    render :show
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    # render json: product.as_json
    if @product.save
      render :show
    else
      render json: { errors: @product.errors.objects.first.full_message }, status: 422
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    if @product.save
      render :show
    else
      render json: { errors: @product.errors.objects.first.full_message }, status: 422
    end
  end

  def destroy
    product_id = params[:id]
    product = Product.find(product_id)
    product.destroy
    render json: { message: "Product destroyed!" }
  end
end
