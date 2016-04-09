class Cat
  attr_accessor :name
  def initialize(name, fur_color)
    @name = name
    @fur_color = fur_color
  end

  def sound
    puts "I hear #{@name} make a sound: prrrrr"
  end
end
