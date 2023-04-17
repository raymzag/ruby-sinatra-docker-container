require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require 'pry'

get '/' do
  "Hello world!"
end

get '/test' do
  "#{$posthog.get_feature_flag('test-feature', 1)}"
end