require 'sinatra'
require 'httparty'
require 'active_support/time'
require 'yaml'

Dir['lib/*.rb'].each { |f| load f }

keys = YAML.load_file "keys.yml"
api_key = keys["open_weather"]

get '/' do
	res = MemoryCache.cache(:weather, expires_in: 1.hour) do 
		HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?zip=94040,us&APPID=#{api_key}")
	end 

  res
end