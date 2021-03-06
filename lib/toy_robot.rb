lib = File.dirname(__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubygems'
require 'toy_robot/table'
require 'toy_robot/robot'
require 'toy_robot/simulator'

# Our toy robot structure
module ToyRobot
  def self.simulator(argv)
    simulator = Simulator.new(table: [4, 4])
    if argv.size > 0
      File.open(argv[1]).each { |command| simulator.call command }
    else
      loop { simulator.call(gets.chomp) }
    end
  end
end
