require 'sinatra'
require 'sinatra/jsonp'

@@strategies = File.read('config/oblique.txt').split "\n"

get '/' do
  jsonp @@strategies.sample
end

get %r{/([1-9]\d*)} do |index|
  cache_control :public
  jsonp @@strategies.fetch(index.to_i - 1) { halt 400 }
end
