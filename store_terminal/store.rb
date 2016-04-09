require "./inventory"
require "./navlist"
require "./cart"

class Store
  def initialize
    @inventory = Inventory.new
    @navigator = NavList.new
    @cart = Cart.new
  end

  def what_is_in_store
    @inventory.list
  end

  def what_to_do_store
    @navigator.what_to_do
  end

  def checkout
    p "That will be $#{@cart.total_amount}"
    todo_choice
  end

  def show_content_cart
    @cart.list
    todo_choice
  end


  #Customer options
  def todo_choice
    what_to_do_store
    # Redirects to right option
      puts "Please choose a option: (1 - 6)"
      todo = gets.chomp.to_i
      case todo
        when 1
          show_inventory
        when 2
          shop_for_item
        when 3
          sell
        when 4
          show_content_cart
        when 5
          checkout
        when 6
          puts "Have a very good day then. Hope we will see you again"
          puts "Bye!!"
          exit
        else
          #dont_understand
          puts "Dont understand you, can you repeat that?"
          todo_choice
      end
  end

  def show_inventory
    what_is_in_store
    puts "\nYou now return to the main menu"
    sleep 2
    todo_choice

  end

  def shop_for_item
    what_is_in_store
    puts "Select item to buy by product id"
    id = gets.chomp.to_i
     result = @inventory.get_product(id)
     @cart.add_product(result)
     todo_choice
  end
end
