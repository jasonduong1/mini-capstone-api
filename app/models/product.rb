class Product < ApplicationRecord
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
