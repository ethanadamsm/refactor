module Utilities

	SECONDS_IN_YEAR = 60 * 60 * 24 * 365.0
	
	def leap_year(x)
		divisable_100?(x) ? divisable_400?(x) : divisable_4?(x)
	end

	def percentage_year(a)
		('%.1f' % percentage_secs(a) + '%')
	end

	def convert(x)
		hours, string = x.split(":")
		minutes, timestate = string.split(" ")

		convert_military(hours, minutes, timestate)
	
	end

	def convert2(x)
		a, b = x.split(":")
		c = ""

		if a.to_i < 12
			c = a + b + " am"
		else
			c = a + b + " pm"
		end

		return c
	end

	def okay(a, b)
		c = false
		if (a.split(":")[0].to_i >= 8 && b || a.split(":")[0].to_i >= 10 && !b) && a.split(":")[1].split(" ")[1] == 'pm'
			c = false
		else
			c = true
		end
		return c
	end

	def span(a, b)
		c = 0
		d = 0
		if a < b
			c = b
			d = a
		else
			c = a
			d = b
		end

		return ('%.1f' % (amount(c)[0..-2].to_f - amount(d)[0..-2].to_f)).to_s + '%'
	end

	private
		
		def divisable_400?(x)
			x % 400 == 0			
		end

		def divisable_100?(x)
			x % 100 == 0			
		end

		def divisable_4?(x)
			x % 4 == 0
		end

		def percentage_secs(a)
			(a / SECONDS_IN_YEAR) * 100
		end

		def is_am?(x)
			x = x.downcase
			x == "am"
		end

		def convert_military(hours, minutes, timestate)
			change = 12
			if is_am?(timestate)
				is_12?(hours)
			else
				 ? condense_time(hours, minutes) : condense_time((hours.to_i + change).to_s,  minutes)
			end
			condense_time(hours, minutes, change)
		end

		def condense_time(hours, minutes, change)
			(hours.to_i + change + ":" + minutes).to_s
		end

		def is_12?(x)
			x.to_i == 12
		end

end