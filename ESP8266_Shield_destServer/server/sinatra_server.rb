Dir['lib/*.rb'].each { |f| load f.to_s }
Dir['controllers/*.rb'].each {|f| load f.to_s}
require 'sinatra'
require 'httparty'
require 'active_support/time'
require 'yaml'
require 'byebug'
require 'json'

get '/' do
	WeatherController.weather
end

get '/weather/:num' do
	number_to_return = params['num'] || 3
	WeatherController.weather(number_to_return)
end