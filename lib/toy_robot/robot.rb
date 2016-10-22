module ToyRobot
  # The robot needs to be placed before the movements
  class Robot
    NORTH = 'NORTH'.freeze
    EAST = 'EAST'.freeze
    WEST = 'WEST'.freeze
    SOUTH = 'SOUTH'.freeze

    attr_reader :position, :orientation
    attr_accessor :table

    def initialize
      @position = nil
      @orientation = nil
      @table = nil
    end

    def place(position, orientation)
      @position = position
      @orientation = orientation
    end

    def report
      puts "Output: #{@position[0]},#{@position[1]},#{@orientation}"
    end
  end
end
