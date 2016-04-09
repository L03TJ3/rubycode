require './contacts_file'

#-----------METHODS -------------------

#method for  a loop through each value in array contacts
def index( contacts )
  contacts.each_with_index do |contact , i|
    puts "#{i+1}) #{contact[:name]}"
  end
end

#method to show a user with all its attributes
def show ( contact )
  puts "#{contact[:name]}"
  puts "phone: #{contact[:phone]}"
  puts "email: #{contact[:email]}"
  puts
end

#Method for asking user which user they would like to see
def ask( prompt )
  print prompt
  gets.chomp
end

def create_new
  #Array for the new contact
  contact = {}

  puts
  puts "Enter contact info:"

  #Asks for the values and stores them in contact Array
  #Where the symbol is the key
  contact[:name]  = ask "Name? "
  contact[:phone] = ask "Phone?"
  contact[:email] = ask "Email?"

  #Puts the new contact in array contacts
  contact
end

# Method for show all contacts in the contacts array
def action_show( contact, i )
  contact = contact[i-1]

  puts
  show( contact )
  puts
end

# Method for creating the new users
def action_new( contacts )

    #calls the create new method to create a new contact
    contact = create_new

    #puts the newly created contact in the contacts array
    contacts << contact

    write_contacts( contacts )

    puts
    puts "New contact created:"
    puts

    #Shows the newly created user
    show( contact )
    puts
end

#Method for deleting a user by input
def action_delete ( contacts )
  puts
  response = ask "Delete which contact? "

  #Store's the input to integer
  i = response.to_i

  puts
  puts "Contact for #{contacts[i-1][:name]} deleted."

  #delete the contact by index  -1 for arrays count from 0
  # delete_at = For arrays because you want to delete it by and index (so at index)
  # for use on hashes its just delete, because you delete it by key.
  contacts.delete_at( i-1 )

  #Calls write_contacts method (that sits in the contacts_file.rb)
  write_contacts( contacts )
end

# Puts error message when a user gives invalid input
def action_error
  puts
  puts "Sorry, I don't recognize that command."
  puts
end

# Method for letting users search on Begin letter first/sur name
def action_search( contacts )
  puts
  pattern = ask "Search for? "
  puts
  contacts.each do |contact|

    #Patttern works on the first letter of first/sur name
    if contact[:name] =~ /\b#{pattern}/i
      show ( contact )
      puts
    end
  end
end

#----------------END OF METHODS -------------------

#loop so that after a user chose a contact, it not exits
#but asks for another contact that they would like to see
loop do

  #load contacts from json file
  contacts = read_contacts

  #Asks user which user they would like to see
  index( contacts )
  #Store's the input that user gave by the response method
  #So that that input can be used to show a specific contact
  puts
  response = ask "Who would you like to see? (n for new. d for delete , s for search, q to quit) "

  #break when a user inputs 'q'
  break if response == "q"

  #User can create a new contact after selecting 'n'
  if response == "n"

    #Calls action_new to create new contacts
    action_new( contacts )

  elsif response == "d"
    #Calls the action delete method
    action_delete( contacts )

  elsif response == "s"
    #Calls action_search method to let users search for contacts
    action_search ( contacts )

  elsif response =~ /[0-9]+/
    #Calls action_show method to show all contacts in the contacts array
    action_show( contacts, response.to_i )

  else
    #Calls method action_error, when a user gives invalid input
    action_error
  end
end

#Goodbye message.
#Only runs after user decides to quit
puts
puts "Bye!"
