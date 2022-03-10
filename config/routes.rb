Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/all_products" => "products#all_products"
  get "/first_product" => "products#first_product"

  get "/product_query" => "products#which_product"
  get "/product/:number" => "products#which_product"
end
