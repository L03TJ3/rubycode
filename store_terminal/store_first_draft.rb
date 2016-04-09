@total_price = 0.0
@shopping_cart = ""


@stock_inventory = {
  :candy => [
    {:type => "Bubblegum", :price => 1.50 },
    {:type => "chocolate", :price => 2.50 },
    {:type => "winegums",  :price => 0.50 }
  ],
  :sigarettes => [
    {:type => "Marlboro", :price => 6.50 },
    {:type => "L&M",      :price => 5.40 },
    {:type => "Camel",    :price => 6.00 }
  ],
  :beer => [
    {:type => "Heineken",   :price => 1.50 },
    {:type => "Amstel",     :price => 1.50 },
    {:type => "Hertogjan",  :price => 0.50 }
  ]
}

def add_to_price(price, quantity = 1)
  @total_price += (price * quantity)
end

def add_to_cart(product, amount, price)
  @shopping_cart << "\n - #{amount} #{product} ------- p/c $#{price}"
end

def show_total_prize
  puts "\n ----------------------------
  with a total price of: $#{@total_price} \n"
end

def show_content_cart
  puts "You have the following items in your cart: #{@shopping_cart}"
end

def show_sub
  counter = -1
  @length = "#{@stock_inventory[@inv_type].length}".to_i
  puts "We have the following #{@inv_type}"
  while counter < @length - 1
     counter += 1
     @type =  "#{@stock_inventory[@inv_type][counter][:type]}"
     @price = "#{@stock_inventory[@inv_type][counter][:price]}"
     puts "#{counter}) #{@type} --- Price: $#{@price}"
  end
end

def welcome
    puts "Good day to you sir."
    show_inventory
end

def show_inventory
  counter = 0
  puts " What would you like to buy?"
    @stock_inventory.each do | main_stock, sort |
      counter += 1
      puts  "#{counter}----#{main_stock}"
    end
      puts "Make choice with (1 - 3)"
      choice = gets.chomp.to_i
      case choice
      when 1
        @inv_type = :"candy"
        buy_candy
      when 2
        @inv_type = :"sigarettes"
        @what_sort = "sigarettes"
        eighteen
      when 3
        @inv_type = :"beer"
        @what_sort = "beers"
        eighteen
      else
        puts "I didn't understand you?"
        show_inventory
      end
end

def buy_candy
      show_sub
      puts "What kind of #{@inv_type} would you like?"
      sleep 1
      puts "Make a choice (0 - #{@length - 1})"
      @wtb = gets.chomp.to_i
      @buy_what = @stock_inventory[@inv_type][@wtb]
      @buy_price = @stock_inventory[@inv_type][@wtb][:price]
      puts @buy_price
#      add_to_price(@buy_price, @buy_what)
#      add_to_cart(@inv_type, @wtb, @buy_price)
#      choice_yesno



      # puts @stock_inventory[@inv_type][@wtb][:price]




#      puts "#{type}"
#      candy = gets.chomp.to_i
#      add_to_cart( "candy", candy, price)
#      choice_yesno
end

def choice_yesno
  show_content_cart
  show_total_prize
  sleep 2
  puts "Would you like to buy anything else? (yes or no)"
  choice = gets.chomp.downcase
  if choice == "yes"
    show_inventory
  elsif choice == "no"
    checkout
  else
    puts "I didn't understand you?"
    choice_yesno
  end
end

# When buying sigarettes or beer, check the age
def eighteen
  puts "How old are you?"
  age = gets.chomp.to_i
  if age >= 18
    eighteen_buy(@what_sort)
  elsif age < 18
    puts "Sorry your not old enough"
    choice_yesno
  else
    puts "I didn't understand you?"
    eighteen
  end
end

#Customer when is verified that he is older than 18
#Can buy or beer or sigarettes
def eighteen_buy(type)
  show_sub

#  if type == "sigarettes"
#    puts "A package of #{type} is #{sigarettes}. How many do you want?"
#    sig = gets.chomp.to_i
#    add_to_price(sigarettes, sig)
#    add_to_cart("package of #{type}", sig, sigarettes)
#    choice_yesno
#  elsif type == "beers"
#    puts "A package of #{type} is #{beers}. How many do you want?"
#    beer = gets.chomp.to_i
#    add_to_price(beers, beer)
#    add_to_cart(type, beer, beers)
   choice_yesno
#  end
end

#The customer doesn't want to buy anything else
def checkout
  show_content_cart
  puts "Please pay the amount of $#{@total_price}:"
  checkout_amount = gets.chomp.to_i
  checkout_complete = @total_price -= checkout_amount
  if checkout_complete == 0
    puts "That was all then, have a great day!"
  else
    puts "There is still $ #{@total_price} left, can you please pay the remaining amount:"
    checkout
  end
end

welcome
