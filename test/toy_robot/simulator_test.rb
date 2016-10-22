require 'test_helper'

module ToyRobot
  class SimulatorTest < TestHelper
    def setup
      @simulator = Simulator.new(table: [4, 4])
      @simulator.call('PLACE 0,0,NORTH')
    end

    def test_should_run_place_command_to_position_0_0_and_face_it_to_north
      assert_equal [0, 0], robot.position
      assert_equal Robot::NORTH, robot.orientation
    end

    def test_should_run_report_command
      assert_output(/Output: 0,0,NORTH/) { @simulator.call('REPORT') }
    end

    def test_should_run_move_command
      @simulator.call 'MOVE'
      assert_equal [0, 1], robot.position
    end

    def test_should_run_left_command
      @simulator.call 'LEFT'
      assert_equal Robot::WEST, robot.orientation
    end

    def test_should_run_right_command
      @simulator.call 'RIGHT'
      assert_equal Robot::EAST, robot.orientation
    end

    def test_should_ignore_invalid_command
      @simulator.call 'TEST'
      assert_equal [0, 0], robot.position
      assert_equal Robot::NORTH, robot.orientation
      assert robot.table
    end

    def test_should_ignore_invalid_place_command_params
      @simulator.call 'PLACE A,2,NORTH'
      assert_equal [0, 0], robot.position
      assert_equal Robot::NORTH, robot.orientation

      @simulator.call 'PLACE 1,2,NOTHING'
      assert_equal [0, 0], robot.position
      assert_equal Robot::NORTH, robot.orientation

      @simulator.call 'PLACE ,,,'
      assert_equal [0, 0], robot.position
      assert_equal Robot::NORTH, robot.orientation

      @simulator.call 'PLACE 1,2,SOUTH,TEST' 
      assert_equal [0, 0], robot.position
      assert_equal Robot::NORTH, robot.orientation
    end

    private

    def robot
      @simulator.instance_variable_get(:@robot)
    end
  end
end
