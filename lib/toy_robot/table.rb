module ToyRobot
  # Surface where the robot will move
  class Table
    attr_reader :dimension, :robot

    def initialize(dimension = [4, 4])
      @dimension = dimension
      @robot = nil
    end

    def place_robot(robot, position, orientation)
      if valid_position? position
        @robot = robot
        @robot.place(position, orientation)
        @robot.table = self
      else
        puts 'Output: Please set a valid position for this robot'
      end
    end

    def valid_position?(position)
      position[0] <= @dimension[0] && position[1] <= @dimension[1]
    end
  end
end
