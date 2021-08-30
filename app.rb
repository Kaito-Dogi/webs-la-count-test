require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
end

get '/' do
  @number = Count.find(1).number
  erb :index
end

post '/count' do
  count = Count.find(1)
  count.number = count.number + 1
  count.save
  redirect '/'
end
  