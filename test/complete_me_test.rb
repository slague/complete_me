require 'minitest/autorun'
require_relative '../lib/complete_me'
require 'minitest/pride'


class CompleteMeTest < Minitest::Test

  def test_complete_me_exists
    cm = CompleteMe.new
    assert cm
    assert Node, cm.root
    refute cm.root.value
  end

  def test_insert
    cm = CompleteMe.new
    a_node = Node.new('a')
    t_node = Node.new('t')
    cm.insert("cat")
    assert cm.root.children["c"], Node

    assert a_node.value, cm.root.children["c"].children['a'].value
    assert t_node.value, cm.root.children["c"].children["a"].children['t'].value

    refute cm.root.children["a"]
    refute cm.root.children["t"]
  end

  def test_it_counts_words
    cm = CompleteMe.new
    cm.insert('cat')
    cm.insert('cats')

    assert 2, cm.count
  end

  def test_it_suggests_words
    cm = CompleteMe.new
    cm.insert('something')
    cm.insert('some')
    cm.insert('south')
    cm.insert('sing')

    assert ['something', 'some', 'south'], cm.suggest('so')
    assert ['something', 'some', 'south', 'sing'], cm.suggest('s')
  end

  def test_it_populates
    cm = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    cm.populate(dictionary)

    assert 235886, cm.count
  end

  def test_it_selects_high_frequency_words
    cm = CompleteMe.new
    cm.insert('something')
    cm.insert('some')
    cm.insert('south')
    cm.insert('sing')

    cm.select("so", "some")
    assert ["some", "something", "south"], cm.suggest("so")
  end
end
