class Cart

  def initialize
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total_amount
    total = 0
    @products.each do |product|
      total += product.price
    end
    return total
  end

  def list
    puts "\nYou have the following items in your shoppingcart:"
    @products.each do |product|
      puts product.name
    end
    puts "Total amount of: $#{total_amount.to_s}"
    puts "---------------"
  end
end
