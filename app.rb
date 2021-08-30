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
  @title = Count.find(1).title
  puts "----------- #{@title} -----------"
  if Count.count > 1
    @number2 = Count.find(2).number
  end
  erb :index
end

post '/add' do
  count = Count.find(1)
  count.number = count.number + 1
  count.save
  redirect '/'
end

post '/minus' do
  count = Count.find(1)
  count.number = count.number - 1
  count.save
  redirect '/'
end

post '/clear' do
  count = Count.find(1)
  count.number = 0
  count.save
  redirect '/'
end

post '/multiple' do
  count = Count.find(1)
  count.number = count.number * 2
  count.save
  redirect '/'
end

post '/divide' do
  count = Count.find(1)
  count.number = count.number / 2
  count.save
  redirect '/'
end

# 後で:idを用いて実装する．
post '/add2' do
  if Count.count < 2
    Count.create(number: 0)
  end
  count = Count.find(2)
  count.number = count.number + 1
  count.save
  redirect '/'
end

post '/add_title' do
  count = Count.find(1)
  count.title = params[:title]
  puts "----------- #{count.title} -----------" #params[:title]は取得できている．
  count.save
  redirect '/'
end