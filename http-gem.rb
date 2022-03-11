require "http"
require_relative "models/concerns"

response = HTTP.get("http://localhost:3000/products/1")
pp response.parse(:json)

puts "let's create a new product"
puts "what is the name of the product you would like to create?"
name = gets.chomp
puts "what is the price?"
price = gets.chomp
puts "do you have an image url for the product?"
image_url = gets.chomp
puts "type in the description of the product"
description = gets.chomp

product = Product.new
product.name = name || product.name
product.price = price || product.price
product.image_url = image_url || product.image_url
product.description = description || product.description
product.save
p product
