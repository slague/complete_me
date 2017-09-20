class Node

  attr_reader :value
  attr_accessor :children, :end_of_word, :weights

  def initialize(value)
    @value = value
    @children = {}
    @end_of_word = false
    @weights = {}
    # @weights = []
  end
end
