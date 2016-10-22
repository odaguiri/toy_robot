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

    def test_should_be_true_on_valid_position
      table = Table.new([4, 4])
      assert table.valid_position? [3, 4]
    end

    def test_should_be_false_on_invalid_position
      table = Table.new([5, 5])
      refute table.valid_position? [6, 1]
    end
  end
end
