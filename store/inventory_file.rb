require 'json'

def read_inventory
  json = File.read( 'inventory.json' )
  array = JSON.parse( json, { :symbolize_names => true } )
end

def add_to_inventory( inventory )
  File.open( "inventory.json", "w" ) do |f|
    json = JSON.pretty_generate( inventory )
    f.write( json )
  end
end
