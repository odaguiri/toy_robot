module ToyRobot
  # The robot needs to be placed before the movements
  class Robot
    ORIENTATIONS = [EAST = 'EAST'.freeze, NORTH = 'NORTH'.freeze,
                    WEST = 'WEST'.freeze, SOUTH = 'SOUTH'.freeze].freeze

    attr_reader :position
    attr_accessor :table

    def initialize
      @position = nil
      @table = nil
      @compass = []
    end

    def place(position, orientation)
      @position = position
      @compass = orient_compass(orientation)
    end

    def report
      return unless placed?
      puts "Output: #{@position[0]},#{@position[1]},#{orientation}"
    end

    def move
      return unless placed?
      case orientation
      when EAST then validate_move(0, :+)
      when NORTH then validate_move(1, :+)
      when WEST then validate_move(0, :-)
      when SOUTH then validate_move(1, :-)
      end
    end

    def left
      return unless placed?
      @compass.rotate!
    end

    def right
      return unless placed?
      @compass.rotate!(-1)
    end

    def orientation
      @compass.first
    end

    private

    def placed?
      @table ? true : false
    end

    def validate_move(coordinate, operation)
      temp = @position.dup
      temp[coordinate] = temp[coordinate].send(operation, 1)
      @position = temp if @table.valid_position? temp
    end

    def orient_compass(orientation)
      ORIENTATIONS.dup.rotate(ORIENTATIONS.find_index(orientation))
    end
  end
end
