require 'test_helper'

module ToyRobot
  class RobotTest < TestHelper
    def test_should_place_robot_somewhere
      robot = Robot.new
      robot.place([0, 2], Robot::NORTH)

      assert_equal [0, 2], robot.position
      assert_equal 'NORTH', robot.orientation
    end

    def test_should_place_robot_on_valid_table_place
      robot = Robot.new
      table = Table.new([4, 4])

      table.place_robot(robot, [0, 2], Robot::SOUTH)

      assert_equal [0, 2], robot.position
      assert_equal 'SOUTH', robot.orientation
      assert_equal table, robot.table
    end

    def test_should_not_place_robot_on_invalid_table_place
      robot = Robot.new
      table = Table.new([4, 4])

      assert_output(/Please set a valid position for this robot/) do
        table.place_robot(robot, [5, 2], Robot::WEST)
      end

      refute robot.position
      refute robot.orientation
      refute robot.table
    end

    def test_should_report_robot_place
      robot = Robot.new
      robot.place([1, 2], Robot::NORTH)
      assert_output(/Output: 1,2,NORTH/) { robot.report }
    end
  end
end
