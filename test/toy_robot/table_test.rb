require 'test_helper'

module ToyRobot
  class TableTest < TestHelper
    def test_should_return_default_dimension
      table = Table.new
      assert_equal [4, 4], table.dimension
    end

    def test_should_return_custom_dimension
      table = Table.new([3, 2])
      assert_equal [3, 2], table.dimension
    end
  end
end
