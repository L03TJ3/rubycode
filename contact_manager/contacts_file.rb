require 'json'


#Read the contacts from a json file
def read_contacts

  #Gets data out of the jason file.
  json = File.read( 'contacts.json' )

  #Puts the data from json in a variable called array
  # Parses the data to change the keys from string to symbols
  array = JSON.parse( json, { :symbolize_names => true } )
end

# Add to the contacts in json file
def write_contacts( contacts )

  # Open file contacts.json "w" is definining  that its writable
  File.open( "contacts.json", "w" ) do |f|

    json = JSON.pretty_generate( contacts )
    f.write( json )
  end
end
