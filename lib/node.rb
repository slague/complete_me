class Node

  attr_reader :value
  attr_accessor :children
  def initialize(value)
    @value = value
    @children = {}
  end
end
