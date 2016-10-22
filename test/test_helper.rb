$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'toy_robot'
require 'minitest/autorun'

class TestHelper < Minitest::Test
end
