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
      return unless placed?
      puts "Output: #{@position[0]},#{@position[1]},#{@orientation}"
    end

    def move
      return unless placed?
      case @orientation
        when NORTH then validate_move(1, :+)
        when EAST then validate_move(0, :+)
        when SOUTH then validate_move(1, :-)
        when WEST then validate_move(1, :+)
      end
    end

    private

    def placed?
      return true if @table
      puts 'Output: Before any action you need to place your robot on the table'
      false
    end

    def validate_move(coordinate, operation)
      temp = @position.dup
      temp[coordinate] = temp[coordinate].send(operation, 1)

      if @table.valid_position? temp
        @position = temp
      else
        x, y = temp
        puts "Output: Your robot can`t move to #{x},#{y},#{@orientation}"
      end
    end
  end
end
