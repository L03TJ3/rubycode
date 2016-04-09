@ingredients = {
  "salmon" => 1,
  "tomatos" => 2,
  "union" => 1,
  "garlic" => 1,
  "pasta" => "250 grams of",
  "sauce" => "500 ml of tomato"
}
@herbs = ["ita_herbs", "cajun", "pepper", "Bell pepper powder",
          "buillion powder"]

def welcome
  puts "Welcome to interactive cooking, I'm your chef today"
  sleep 1
  what_dish
end

def ingredients_inventory
  @ingredients.each do |ingredient, sort|
    puts "Take #{sort} #{ingredient}"
  end
end

def what_dish
  puts "Which dish would you like to make?
  1) salmon pasta"
  which_dish = gets.chomp.to_i
  case which_dish
  when 1
    get_salmon
  else
    puts "sorry we don't have that today, please choose a different dish"
    what_dish
  end
end

def get_salmon
 puts "Today we're going to make a salmon pasta with tomato sauce"
 sleep 2
 puts "You will need the following ingredients:"
 ingredients_inventory
 sleep 2
 puts "First step is cutting the ingredients"
 sleep 2
 cut_ingredients
end

def cut_ingredients
  puts "Do you want to start cutting now? (y/n)"
  start_cutting = gets.chomp.downcase
  if start_cutting == "y"
    counter = 1
      @ingredients.each do |ingredient, sort|
        puts "Cut the #{sort} #{ingredient} in small pieces"
        counter += 1
        if counter == 5
          boil_pasta
          break
        end
      end
  else
    puts "thats too bad, then maybe start with another dish"
    what_dish
  end
end

def boil_pasta
  sleep 2
  puts "next up is the pasta:"
  puts "Put on the water and wait till it boils"
  sleep 2
  puts "When it boils, put in the #{@ingredients["pasta"]} pasta
  and boil it for another 8 minutes"
  sleep 2
  bake
end

def bake
  counter = 1
    puts "Now let's bake. Take a pan and put it on the fire"
    @ingredients.each do |ingredient, sort|
      puts "Add the #{ingredient} and bake"
      counter += 1
      if counter == 5
        sleep 2
        add_herbs
        break
      end
    end
end

def add_herbs
  puts "Here you can choose what herbs you want to add:"
  
end
welcome
