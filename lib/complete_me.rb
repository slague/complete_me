require_relative 'node'

class CompleteMe

  attr_reader :root
  attr_accessor :count

  def initialize
    @root = Node.new(nil)
    @count = 0
  end

  def insert(word, node=root, new_word=false)

    if word.length == 0 && new_word == false
      return
    elsif word.length == 0 && new_word == true
      node.end_of_word = true
      @count += 1
      return
    end

    word = word.downcase

    letter = word[0]

    if node.children[letter]
      insert(word[1..-1], node.children[letter])
    else
      node.children[letter]= Node.new(letter)
      new_word = true
      insert(word[1..-1], node.children[letter], new_word)
    end
  end

  def suggest(word, node=root)
    base_word = word.downcase

    until word.empty?
      node = node.children[word[0]]
      word = word.delete(word[0])
    end

    CompleteMe.begin_suggestion(base_word, node)
  end

  def self.begin_suggestion(word, node)
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

  def select(string, word)

  end
end


cm = CompleteMe.new
cm.insert('something')
cm.insert('some')
cm.insert('south')
cm.insert('sing')

# cm.select("so", "some")
cm.suggest("so")
require "pry"; binding.pry
""
