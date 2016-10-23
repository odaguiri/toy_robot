require 'test_helper'

class ToyRobotTest < TestHelper
  def test_should_simulate_read_sample_route_1_file
    assert_output /Output: 0,4,SOUTH/ do
      ToyRobot.simulator(['-f', 'test/samples/route_1.txt'])
    end
  end

  def test_should_simulate_read_sample_route_2_file
    assert_output /Output: 3,4,NORTH/ do
      ToyRobot.simulator(['-f', 'test/samples/route_2.txt'])
    end
  end

  def test_should_simulate_read_sample_route_3_file
    assert_output /Output: 0,4,WEST/ do
      ToyRobot.simulator(['-f', 'test/samples/route_3.txt'])
    end
  end

  def test_should_simulate_read_sample_route_4_file
    assert_output /Output: 4,4,EAST/ do
      ToyRobot.simulator(['-f', 'test/samples/route_4.txt'])
    end
  end

  def test_should_simulate_read_sample_route_5_file
    assert_output /Output: 4,4,EAST/ do
      ToyRobot.simulator(['-f', 'test/samples/route_5.txt'])
    end
  end
end
