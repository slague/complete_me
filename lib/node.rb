class Node

  attr_reader :value
  attr_accessor :children, :end_of_word, :weight

  def initialize(value)
    @value = value
    @children = {}
    @end_of_word = false
    @weight = 0
  end
end
