require 'sinatra'
require 'json'

items = []

get '/items' do
  return JSON.generate(items)
end

post '/item' do
  items << JSON.parse(request.body.read)
  return 200
end
