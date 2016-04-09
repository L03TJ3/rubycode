require './product.rb'
require './category.rb'
require './store'

class Inventory
  def initialize
    @categories = []
    candy_products = [
      Product.new("Bubblegum",  1.50, 1, 1000),
      Product.new("Chocolate",  2.50, 2, 1000),
      Product.new("Winegums " , 0.50, 3, 1000)
    ];
    sigarettes_products = [
      Product.new("Marlboro ",  6.50, 4, 1000),
      Product.new("L&M      ",  5.40, 5, 1000),
      Product.new("Camel    ",  6.00, 6, 1000)
    ]
    beer_products = [
      Product.new("Heineken ",  1.50, 7, 1000),
      Product.new("Amstel   ",  1.50, 8, 1000),
      Product.new("Hertogjan",  0.50, 9, 1000)
    ];
    @categories << Category.new("candy", candy_products)
    @categories << Category.new("sigarettes", sigarettes_products)
    @categories << Category.new("beer", beer_products)
  end

  def get_product(product_id)
    @categories.each do |category, type|
      category.products.each do |product|
        while product.id == product_id do
          return product
        end
      end
    end
    "Sorry can't find that item"
    shop_for_item
  end

  def list
    @categories.each do |category|
      puts "\nThe items we have for #{category.name}"
      category.products.each do |product|
        name = product.name
        price = product.price
        quantity = product.quantity
        id = product.id
        puts  "-type- #{name} -- id) #{id} -- $#{price} -- #{quantity} in store"
      end
    end
  end
end
