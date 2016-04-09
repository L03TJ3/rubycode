# ------ Global Variables ----------
@total_price = 0.0
@shopping_cart = []

@navigator = [
  :show_inventory, :buy, :sell, :shopping_cart, :checkout, :exit
]
@nav_length = @navigator.length
@s_sections = [:candy, :sigarettes, :beer]
@s_sec_length = @s_sections.length
@s_inventory = {
  :candy => [
    {:type => "Bubblegum", :price => 1.50, :id => 1 :quantity => 1000},
    {:type => "Chocolate", :price => 2.50, :id => 1 :quantity => 1000},
    {:type => "Winegums",  :price => 0.50, :id => 1 :quantity => 1000}
  ],
  :sigarettes => [
    {:type => "Marlboro", :price => 6.50, :id => 1,  :quantity => 1000},
    {:type => "L&M",      :price => 5.40, :id => 1,  :quantity => 1000},
    {:type => "Camel",    :price => 6.00, :id => 1,  :quantity => 1000}
  ],
  :beer => [
    {:type => "Heineken",   :price => 1.50, :quantity => 1000},
    {:type => "Amstel",     :price => 1.50, :quantity => 1000},
    {:type => "Hertogjan",  :price => 0.50, :quantity => 1000}
  ]
}

#------End of global variables --------

# Method for invalid input
def dont_understand
  puts "Sorry I didn't understand you correctly"
  sleep 2
  puts "Can you repeat that?"
end

# Shows all options that customers can choose
def what_to_do
  puts "\nWhat do you want to do?"
  @navigator.each_with_index do |navi, i|
    puts " #{i+1}) -- #{navi}"
  end
end

#Show entire inventory
#Not final draft but cannot get the arguments to show data inside the hash
#instead it just shows the hash
#Maybe wrong loop, but I think this is more dynamic???

def open_inventory
  puts "This is what we currently have in stock"
  sleep 2
  @s_inventory.each do |section, products|
    counter = -1
    puts "\n We have for #{section} the following items:"
    counter += 1
      products.each do |type, price, quantity|
        type =  :"type"
        price = :"price"
        quantity = :"quantity"
        p_type = "#{products[counter][type]}"
        p_price = "$#{products[counter][price]}"
        p_quantity = "#{products[counter][quantity]}"
        puts " #{p_type} - #{p_price} - #{p_quantity}"
        counter += 1
      end
  end
  sleep 2
  puts "\nYou will now return to the main menu"
  todo_choice
end

# Loop for main buy options
def buy
  puts "Which section you want to buy from?"
  @s_sections.each_with_index do |section, i|
    puts "#{i+1}) #{section}"
  end
end

def buy_options
  buy
  # Want to actually let users type in the name they want
  # so that i don't need the @buy_type
  puts "What do you want to buy? (1 - #{@s_sec_length})"
  buy_choice = gets.chomp.to_i
  case buy_choice
    when 1
      @buy_type = :"candy"
      buy_center
    when 2
      @buy_type = :"sigarettes"
      buy_center
    when 3
      @buy_type = :"beer"
      buy_center
    else
      dont_understand
      buy_options
  end
end

def buy_center
  #Get's the right type hash
  #types = "#{@s_inventory[@buy_type]}"
end

def sell
  #Want salesman to sell new items
  puts "Work in progress, please choose different"
  todo_choice

end

def shopping_cart
    #show shoppingcart and add/delete items
    puts "Work in progress, please choose different"
    todo_choice
end

def checkout
  #Here customers can pay their items
  puts "Work in progress, please choose different"
  todo_choice

end

#Customer options
def todo_choice
  what_to_do
  puts "Please choose a option: (1 - #{@nav_length})"
  todo = gets.chomp.to_i
  case todo
    when 1
      open_inventory
    when 2
      buy_options
    when 3
      sell
    when 4
      shopping_cart
    when 5
      checkout
    when 6
      puts "Have a very good day then. Hope we will see you again"
      puts "Bye!!"
      exit
    else
      dont_understand
      todo_choice
  end
end

#Welcome message
#puts "Welcome to kiosk Fresh!"

#pause
#sleep 2

#Send customer to main menu
#todo_choice

#is for testing the buy_options
buy_options
