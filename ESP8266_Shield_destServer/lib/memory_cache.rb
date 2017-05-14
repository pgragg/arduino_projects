class MemoryCache

	@@memory = {}
	
	def self.cache(key, opts, &block)
		res = @@memory[key]
		expires_in = opts.fetch(:expires_in, 1.hour)
		if res
			return res[:value] if (res[:timestamp] + res[:expires_in]) >= Time.now 
		end
		if block
			@@memory[key] = {value: block.yield, timestamp: Time.now, expires_in: expires_in}
		end 
		@@memory[key].fetch(:value, nil)
	end


end