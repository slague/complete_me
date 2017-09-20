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
    final_array = CompleteMe.begin_suggestion(base_word, node)
    format_display(final_array)
  end

  def self.begin_suggestion(word, node)
    results = []

    return results if node.nil? #This is for when we populate without a full dictionary. It will catch any letters that have no associated word, for example, if we don't put in any z words, and suggest z.

    if node.children.empty?
      results << [word, node.weight]
    else node.children
      results << [word, node.weight] if node.end_of_word

      node.children.keys.each do | child |
        results << CompleteMe.begin_suggestion((word + child), node.children[child])
      end
    end
      results.flatten
  end

  def format_display(arr)
    count = 0
    num = arr.length/2
    display = []
    num.times do |a|
      display << [arr[count], arr[count+1]]
      count +=2
    end
    build_hash(display)
  end

  def build_hash(arr)
    hash = {}
    arr.each do |a|
      hash[a[0]]= a[1]
    end
    sort_hash(hash)
  end

  def sort_hash(hash)
    ordered = hash.sort_by{ |k, v| v }.reverse.to_h
    ordered.keys
  end

  def select(fragment, full_word)


  end

end


# cm = CompleteMe.new
# cm.insert('sing')
# cm.insert('some')
# cm.insert('something')
# cm.insert('south')
# cm.insert('soup')
# cm.suggest('s')
# require "pry"; binding.pry
# ""
# cm.insert("cat")
# # cm.insert("car")
# cm.insert("cart")
# # cm.insert("cards")
# # cm.insert("computer")
# # cm.insert("camp")
# # cm.insert("cloud")
# # cm.insert("mountain")
# # cm.count
# cm.suggest('ca')
# cm.suggest('c')
# cm.suggest('z')
