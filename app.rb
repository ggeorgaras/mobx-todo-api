require 'sinatra'
require 'json'

before do
  headers 'Access-Control-Allow-Origin' => '*'
  headers 'Access-Control-Allow-Methods' => 'POST, GET, DELETE, OPTIONS'
  headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
end

items = []

get '/items' do
  JSON.generate(items)
end

post '/item' do
  request.body.rewind
  items << JSON.parse(request.body.read)
  status 201
end

delete '/item/:id' do
  id_to_remove = params['id']
  items.delete_if {|item| item['id'] == id_to_remove }

  status 200
end

options '/item' do
end

options '/item/:id' do
end
