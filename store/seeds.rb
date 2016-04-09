# Seed data for store app
require './inventory_file'
require './navigator_file'

inventory = []
navigator = []


inventory << { name: "Drinks : Heineken six-pack     ", id: 1 , price: 6.50 , quantity: 500}
inventory << { name: "Drinks : Cola six-pack         ", id: 2 , price: 5.00 , quantity: 500}
inventory << { name: "Drinks : Red bull four-pack    ", id: 3 , price: 4.50 , quantity: 500}
inventory << { name: "Cigarettes : Marlboro medium   ", id: 4 , price: 6.00 , quantity: 500}
inventory << { name: "Cigarettes : Lucky strike XXL  ", id: 5 , price: 7.50 , quantity: 500}
inventory << { name: "Cigarettes : Camel light       ", id: 6 , price: 5.80 , quantity: 500}
inventory << { name: "Candy : Toblerone              ", id: 7 , price: 1.50 , quantity: 500}
inventory << { name: "Candy : Paprika Lays           ", id: 8 , price: 0.80 , quantity: 500}
inventory << { name: "Candy : Muffin                 ", id: 9 , price: 1.50 , quantity: 500}
inventory << { name: "Candy : Winegums               ", id: 10 , price: 0.50 , quantity: 500}

# Adds the seed data to inventory.json
add_to_inventory( inventory )

navigator << { name: "show_inventory", link: "show"    }
navigator << { name: "search"        , link: "search"  }
navigator << { name: "buy"           , link: "buy"     }
navigator << { name: "shopping cart" , link: "cart"    }
navigator << { name: "checkout"      , link: "checkout"}

add_to_navigator( navigator )
