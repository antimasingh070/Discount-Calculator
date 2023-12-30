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

  # Get user input and convert to quantity count hash
  def user_input
    puts "Please enter all the items purchased separated by a comma -: \n"
    @items = gets.split(' ').join.split(',')
    @item_quantity_hash = @items.each_with_object(Hash.new(0)) { |item, total| total[item.to_sym] += 1 }
  end
end
