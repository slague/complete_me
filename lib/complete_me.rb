require_relative 'node'

class CompleteMe

  attr_reader :root
  attr_accessor :count

  def initialize
    @root = Node.new(nil)
    @count = 0
  end

  def insert(word, node=root)
    if word.length == 0
      node.end_of_word = true
      @count += 1
      return
    end

    letter = word[0]

    if node.children[letter]
      insert(word.delete(letter), node.children[letter])
    else
      node.children[letter]= Node.new(letter)
      insert(word.delete(letter), node.children[letter])
    end
  end

  def suggest(word, node=root)
    base_word = word
    until word.empty?
      node = node.children[word[0]]
      word = word.delete(word[0])
    end
    CompleteMe.begin_suggestion(base_word, node)
  end

  def self.begin_suggestion(word, node)
    require "pry"; binding.pry
    results = []

    return results if node.nil?

    if node.children.empty?
      results << word
    else node.children
      results << word if node.end_of_word

      node.children.keys.each do | child |
        results << CompleteMe.begin_suggestion((word + child), node.children[child])
      end
    end
    results.flatten
  end

  def populate(dictionary)
    dictionary.split("\n").each { |word| insert(word) }
  end
end


cm = CompleteMe.new
# dictionary = File.read("/usr/share/dict/words")
dictionary = "Abranchiata\nabranchiate\nabranchious\nabrasax\nabrase\nabrash"
cm.populate(dictionary)

cm.suggest('abra')
