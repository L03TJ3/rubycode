class Product
  attr_accessor :name, :price, :id, :quantity

  def initialize(name,price,id,quantity)
    @name = name
    @price = price
    @id = id
    @quantity = quantity
  end
end
