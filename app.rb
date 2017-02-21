require 'sinatra'
require 'json'

before do
  headers 'Access-Control-Allow-Origin' => '*'
end

items = []

get '/items' do
  return JSON.generate(items)
end

post '/item' do
  items << JSON.parse(request.body.read)
  return 200
end
