# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product = Product.new(name: "toy car", price: 10, description: "a plastic red car")
product.save
product = Product.new(name: "watch", price: 20, description: "a plastic gold watch with a printed on watch face")
product.save
