require_relative 'node'
class CompleteMe

  attr_reader :root
  def initialize
    @root = Node.new(nil)
  end

  def insert(word, node=root)
    letter = word[0]

    if node.children[letter]
      insert(word.delete(letter), node.children[letter])
    else
      node.children[letter]= Node.new(letter)
    end
  end
end


cm = CompleteMe.new
cm.insert("cat")
require "pry"; binding.pry
""
