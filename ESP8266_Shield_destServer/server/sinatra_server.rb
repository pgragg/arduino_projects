require 'sinatra'
require 'httparty'

require 'yaml'
keys = YAML.load_file "keys.yml"
api_key = keys["open_weather"]

get '/' do
	res = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?zip=94040,us&APPID=#{api_key}")
  res
end