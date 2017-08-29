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




  # first, check the root_node's children hash, to see if the letter is in it
  # if it's not, create a node with the value, and add it to the children hash for root_node, and recurze
  # if it is, move to that node and call the method- recurze
  #
  #   increment counter


end
