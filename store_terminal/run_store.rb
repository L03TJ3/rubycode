require './store'
require './navlist'

store = Store.new
#Welcome message
puts "Welcome to kiosk Fresh!"

#pause
#sleep 2

#Send customer to main menu
store.todo_choice

#Shows entire inventory list
#store.shop_for_item
