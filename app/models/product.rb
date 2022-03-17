class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  def supplier
    Supplier.find_by(id: supplier_id)
  end

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
