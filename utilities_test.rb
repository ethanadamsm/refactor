require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'utilities'

class Methods2Test < MiniTest::Test
	def setup
		@m = Class.new do
     include Utilities
   	end.new
	end

	def test_leap_year
		assert_equal true, @m.leap_year(4)
		assert_equal true, @m.leap_year(400)
		assert_equal true, @m.leap_year(16)
		assert_equal false, @m.leap_year(5)
		assert_equal false, @m.leap_year(7)
		assert_equal false, @m.leap_year(1000)
		assert_equal false, @m.leap_year(1900)
	end

	def test_percentage_year
		assert_equal "120.0%", @m.percentage_year(37843200.0)
		assert_equal "60.0%", @m.percentage_year(18921600.0)
	end

	def test_convert 
		assert_equal "23:00", @m.convert("11:00 pm")
		assert_equal "2:36", @m.convert("2:36 am")
		assert_equal "13:37", @m.convert("1:37 pm")
	end

end
