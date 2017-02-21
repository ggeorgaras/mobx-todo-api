require 'sinatra'
require 'json'

before do
  headers 'Access-Control-Allow-Origin' => '*'
  headers 'Access-Control-Allow-Methods' => 'POST, GET'
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

options '/item' do

end
