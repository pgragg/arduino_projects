class ApiKeys


	def self.get(api_key)
		key_string = api_key.to_s
		if ENV['cloud_app'] == 'true'
			ENV[key_string]
		else
			keys = YAML.load_file "keys.yml"
			keys[key_string]
		end
	end

end