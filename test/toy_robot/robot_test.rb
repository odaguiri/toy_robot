require 'test_helper'

module ToyRobot
  class RobotTest < TestHelper
    def setup
      @robot = Robot.new
      @table = Table.new([4, 4])
    end

    def test_should_place_robot_on_valid_table_place
      @table.place_robot(@robot, [0, 2], Robot::SOUTH)

      assert_equal [0, 2], @robot.position
      assert_equal 'SOUTH', @robot.orientation
      assert_equal @table, @robot.table
    end

    def test_should_not_place_robot_on_invalid_table_place
      @table.place_robot(@robot, [5, 2], Robot::WEST)

      refute @robot.position
      refute @robot.orientation
      refute @robot.table
    end

    def test_should_report_robot_place
      @table.place_robot @robot, [1, 2], Robot::NORTH
      assert_output(/Output: 1,2,NORTH/) { @robot.report }
    end

    def test_should_not_act_if_the_robot_is_not_placed
      @robot.move
      @robot.left
      @robot.right

      refute @robot.position
      refute @robot.orientation
      refute @robot.table
    end

    def test_should_move_robot_to_north
      @table.place_robot @robot, [0, 0], Robot::NORTH
      @robot.move
      assert_equal [0, 1], @robot.position
    end

    def test_should_move_robot_to_east
      @table.place_robot @robot, [0, 0], Robot::EAST
      @robot.move
      assert_equal [1, 0], @robot.position
    end

    def test_should_move_robot_to_south
      @table.place_robot @robot, [0, 2], Robot::SOUTH
      @robot.move
      @robot.move
      assert_equal [0, 0], @robot.position
    end

    def test_should_not_move_robot_to_north
      @table.place_robot @robot, [4, 4], Robot::NORTH
      @robot.move
      assert_equal [4, 4], @robot.position
      assert_equal Robot::NORTH, @robot.orientation
    end

    def test_should_turn_robot_from_north_to_south
      @table.place_robot @robot, [4, 4], Robot::NORTH
      @robot.left
      @robot.left
      assert_equal Robot::SOUTH, @robot.orientation
    end

    def test_should_turn_robot_from_west_to_east
      @table.place_robot @robot, [4, 4], Robot::WEST
      @robot.right
      @robot.right
      assert_equal Robot::EAST, @robot.orientation
    end

    def test_should_turn_robot_from_east_to_north
      @table.place_robot @robot, [3, 2], Robot::EAST
      @robot.left
      assert_equal Robot::NORTH, @robot.orientation
    end

    def test_should_turn_robot_from_south_to_east
      @table.place_robot @robot, [3, 2], Robot::SOUTH
      @robot.left
      assert_equal Robot::EAST, @robot.orientation
    end

    def test_should_turn_robot_from_south_to_west
      @table.place_robot @robot, [3, 2], Robot::SOUTH
      @robot.right
      assert_equal Robot::WEST, @robot.orientation
    end

    def test_should_ignore_moves_until_reach_last_position_from_table_south
      @table.place_robot @robot, [3, 2], Robot::SOUTH
      10.times { @robot.move }
      assert_equal [3, 0], @robot.position
      assert_equal Robot::SOUTH, @robot.orientation
    end

    def test_should_ignore_moves_until_reach_last_position_from_table_west
      @table.place_robot @robot, [3, 2], Robot::WEST
      10.times { @robot.move }
      assert_equal [0, 2], @robot.position
      assert_equal Robot::WEST, @robot.orientation
    end

    def test_should_ignore_moves_until_reach_last_position_from_table_east
      @table.place_robot @robot, [3, 2], Robot::EAST
      10.times { @robot.move }
      assert_equal [4, 2], @robot.position
      assert_equal Robot::EAST, @robot.orientation
    end

    def test_should_ignore_moves_until_reach_last_position_from_table_north
      @table.place_robot @robot, [3, 2], Robot::NORTH
      10.times { @robot.move }
      assert_equal [3, 4], @robot.position
      assert_equal Robot::NORTH, @robot.orientation
    end

    def test_should_move_robot_to_position_4_4_and_face_to_south
      @table.place_robot @robot, [0, 0], Robot::SOUTH

      @robot.left
      assert_equal Robot::EAST, @robot.orientation

      3.times { @robot.move }
      assert_equal [3, 0], @robot.position

      @robot.left
      assert_equal Robot::NORTH, @robot.orientation

      4.times { @robot.move }
      assert_equal [3, 4], @robot.position

      @robot.right
      assert_equal Robot::EAST, @robot.orientation

      @robot.move
      assert_equal [4, 4], @robot.position

      @robot.right
      assert_equal Robot::SOUTH, @robot.orientation
    end
  end
end
