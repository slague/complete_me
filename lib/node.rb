class Node

  attr_reader :value
  attr_accessor :children, :end_of_word

  def initialize(value)
    @value = value
    @children = {}
    @end_of_word = false
  end
end
