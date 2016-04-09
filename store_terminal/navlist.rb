require './navigator'

class NavList
  def initialize
    @nav_choice = []
    @nav_choice << Navigator.new("show_inventory")
    @nav_choice << Navigator.new("buy")
    @nav_choice << Navigator.new("sell")
    @nav_choice << Navigator.new("shopping_cart")
    @nav_choice << Navigator.new("checkout")
    @nav_choice << Navigator.new("exit")
  end

  # Shows all options that customers can choose
    def what_to_do
      puts "\nWhat do you want to do?"
      @nav_choice.each_with_index do |navi, i|
        puts " #{i+1}) -- #{navi.name}"
      end
    end
end
