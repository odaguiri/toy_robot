module ToyRobot
  class Table
    attr_reader :dimension

    def initialize(dimension = [4, 4])
      @dimension = dimension 
    end
  end
end
