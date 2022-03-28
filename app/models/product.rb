class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  has_many :category_products
  has_many :categories, through: :category_products

  has_many :carted_products
  has_many :orders, through: :carted_products

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end

  def is_discounted?
    price < 10 ? :yes : :no
  end

  def tax
    tax = price * 0.09
    tax.round(2)
  end

  def total
    total = price + tax
  end
end
