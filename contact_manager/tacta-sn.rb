require 'sinatra'
require './contacts_file'
set :port, 4567

#route to root page
get '/' do
  "<h1>Tacta Contact Manager</h1>"
end

#route to contacts page
get '/contacts' do

  #sets @contacts to the read_contacts method from (contacts_file.rb)
  #shows all the contacts that are currently in the json file
  @contacts = read_contacts
  erb :'contacts/index'
end

#route to new contacts page
get '/contacts/new' do
  erb :'contacts/new'
end

get '/contacts/search' do
  erb :'contacts/search'
end

post '/contacts/results' do


  @contacts_1 = read_contacts.select { |contact| contact[:name] =~ /#{params[:name]}/i  }
  erb :'contacts/results'
end

# Adds the new user to the json file
post '/contacts' do
  new_contact = {name: params[:name], phone: params[:phone], email: params[:email]}

  #Gets all contacts by the read_contacts
  contacts = read_contacts
  #adds the new contact to contacts
  contacts << new_contact

  #writes over the old contacts with the added contact
  write_contacts( contacts )


  i = contacts.length - 1

  redirect "/contacts/#{i}"

end

#Show a specific contact by id(show.erb) where :i stands for contact id
get '/contacts/:i' do
  @i = params[:i].to_i
  contacts = read_contacts
  @contact = contacts[@i]
  erb :'contacts/show'
end

# Edit the specific contact(edit.erb)
get '/contacts/:i/edit' do
  @i = params[:i].to_i

  contacts = read_contacts
  @contact = contacts[@i]

  erb :'contacts/edit'
end

# Take's the form from edit, and updates the contact with the new data
# At the end it redirects to the edited contact page
post '/contacts/:i/update' do
  i = params[:i].to_i

  updated_contact = { name: params[:name], phone: params[:phone], email: params[:email]}

  contacts = read_contacts
  contacts[i] = updated_contact
  write_contacts( contacts )
  redirect "/contacts/#{i}"
end

# Deletes a contact
get '/contacts/:i/delete' do
  i = params[:i].to_i

  contacts = read_contacts
  contacts.delete_at( i )
  write_contacts( contacts )

  redirect "/contacts"
end
