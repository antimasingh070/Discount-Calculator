class DiscountCalculator

  # Initialize DiscountCalculator
  def initialize()
      @total_price = 0
      @invoice_amount_without_discount = 0
  end

  # Item unit prices
  ITEM_UNIT_PRICES = {
      milk: 3.97,
      bread: 2.17,
      apple: 0.89,
      banana: 0.99
  }

  # Offer prices
  OFFER_PRICES = {
      milk: { quantity: 2, price: 5.00 },
      bread: { quantity: 3, price: 6.00 }
  }
end
