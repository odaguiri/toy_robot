module ToyRobot
  # Simulate our robot on the table using standard input
  class Simulator
    COMMANDS = %w(PLACE MOVE LEFT RIGHT REPORT).freeze

    def initialize(options = {})
      @table = Table.new(options[:table])
      @robot = Robot.new
    end

    def call(string)
      command string
    end

    private

    def command(string)
      @method, @params = string.split(' ')
      return place if 'PLACE' == @method
      if COMMANDS.include? @method
        @robot.send(@method.downcase)
      else
        puts "#{@method} is an invalid command try (PLACE, MOVE, LEFT, RIGHT or REPORT)"
      end
    end

    def place
      x, y, orientation = @params.split(',')
      @table.place_robot @robot, [x.to_i, y.to_i], Robot.const_get(orientation)
    end
  end
end
