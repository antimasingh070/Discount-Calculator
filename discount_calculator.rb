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
    convert_item_to_quantity_count_hash
  end
  
  # Calculate amount
  def calculate_amount
    # Display the header for the itemized list
    puts "Item      Quantity      Price"
    puts "--------------------------------------"

     # Iterate through each item and its quantity
    @item_quantity_hash.each do |item, quantity|
        # Calculate the total price for the current item
        @item_total_price = quantity * ITEM_UNIT_PRICES[item]
    
        # Check if there is a special offer for the current item
        if OFFER_PRICES[item]
            remainder = quantity % OFFER_PRICES[item][:quantity]
            divider = quantity / OFFER_PRICES[item][:quantity]

            # Calculate the total price with the offer
            @total_price += @item_quantity_test = divider * OFFER_PRICES[item][:price] + remainder * ITEM_UNIT_PRICES[item]
        else
            # If no offer, use the regular item price
            @total_price += @item_quantity_test = @item_total_price
        end
    
        # Display the item, its quantity, and the calculated price
        puts "#{'%-11s' % item.capitalize}#{'%-14s' % quantity}$#{@item_quantity_test}" 

        # Update the total amount without discount 
        @invoice_amount_without_discount += @item_total_price
    end
    
    @total_price.round(2)
  end

  # Calculates and returns the saved amount.
  def calculate_saved_amount
    (@invoice_amount_without_discount - @total_price).round(2)
  end

  private

  # Convert items to quantity count hash
  def convert_item_to_quantity_count_hash
    @item_quantity_hash = @items.each_with_object(Hash.new(0)) { |item, total| total[item.to_sym] += 1 }
  end

end

# Create an instance of DiscountCalculator
discount_calculator = DiscountCalculator.new

# Get user input for purchased items
discount_calculator.user_input

# Display the calculated total price and savings
puts "Total price : $" + discount_calculator.calculate_amount.to_s
puts "You saved $" + discount_calculator.calculate_saved_amount.to_s + " today."