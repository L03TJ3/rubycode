def get_name_and_age

  puts "What's your name?"
  name = gets.chomp

  puts "How old are you?"
  age = gets.chomp.to_i

  return name, age
end

def ask_gender
  gender = ""

  while gender != "M" && gender != "V"
    puts "what's your gender (m/v)"
    gender = gets.chomp
    gender.upcase!
  end

  return gender
end
name, age = get_name_and_age

gender = ask_gender

if gender == "M" && age >= 18
  puts "Good morning SIR #{name}!"
elsif gender == "V" && age >= 18
  puts "Good morning MADAM #{name}!"
else
  puts "Goedemorgen #{name}!"
end
