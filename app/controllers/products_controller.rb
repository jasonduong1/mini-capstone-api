class ProductsController < ApplicationController
  def all_products
    contacts = Contact.all
    render json: contacts.as_json
  end
end
