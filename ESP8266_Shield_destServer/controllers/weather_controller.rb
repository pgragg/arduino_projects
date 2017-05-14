Dir['lib/*.rb'].each { |f| load f.to_s }
require 'byebug'
class WeatherController

	def self.weather(num = 3)
		num = num.to_i
		output = {}
		weather_response = get_weather
		weather_response["list"].first(num).each_with_index do |w_object, index| 
			output[index] = kelvin_to_farenheit(w_object['main']['temp'].to_f)
		end
		output.to_h.to_json
	end

	private

	def self.kelvin_to_farenheit(k)
		((9.0/5.0)*(k - 273) + 32).round(0)
	end

	def self.get_weather
		res = MemoryCache.cache(:weather, expires_in: 1.hour) do 
			HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?zip=94040,us&APPID=#{api_key}").to_h
		end 
	  res.to_h
	end

	def self.api_key 
		ApiKeys.get('open_weather_api_key') 
	end

end