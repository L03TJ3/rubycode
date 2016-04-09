require 'json'

def read_navigator
  json = File.read( 'navigator.json' )
  array = JSON.parse( json, { :symbolize_names => true} )
end

def add_to_navigator( navigator )
  File.open( "navigator.json", "w" ) do |f|
    json = JSON.pretty_generate( navigator )
    f.write( json )
  end
end
