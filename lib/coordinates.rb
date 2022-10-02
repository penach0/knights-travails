# Constants and methods relating to creating the board coordinates
# and working with them
module Coordinates
  X = [*'a'..'h'].freeze
  Y = [*1..8].freeze
  TWO_STEPS = [2, -2].freeze
  ONE_STEP = [1, -1].freeze

  def inside_board?(x, y)
    [x, y].all? { |element| element.between?(0, 7) }
  end
end
