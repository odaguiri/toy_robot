module ToyRobot
  # The robot needs to be placed before the movements
  class Robot
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
  end
end
