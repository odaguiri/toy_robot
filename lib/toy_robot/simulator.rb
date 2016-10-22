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
      @robot.send(@method.downcase) if COMMANDS.include? @method
    end

    def place
      return unless valid_place_params?
      pos = [@params[:x], @params[:y]]
      @table.place_robot @robot, pos, Robot.const_get(@params[:orientation])
    end

    def valid_place_params?
      return false if (params = @params.split(',')).size > 3
      x, y, orientation = params
      return false unless x =~ /\A\d+\Z/ &&
                          y =~ /\A\d+\Z/ &&
                          Robot::ORIENTATIONS.include?(orientation)

      @params = { x: x.to_i, y: y.to_i, orientation: orientation }
    end
  end
end
