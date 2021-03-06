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

    assert_equal a_node.value, cm.root.children["c"].children['a'].value
    assert_equal t_node.value, cm.root.children["c"].children["a"].children['t'].value

    refute cm.root.children["a"]
    refute cm.root.children["t"]
  end

  def test_it_counts_words
    cm = CompleteMe.new
    cm.insert('cat')
    cm.insert('cats')

    assert_equal 2, cm.count
  end

  def test_it_suggests_words
    cm = CompleteMe.new
    cm.insert('sing')
    cm.insert('some')
    cm.insert('something')
    cm.insert('south')
    cm.insert('soup')

    assert_equal ["soup", "south", "something", "some"], cm.suggest('so')
    assert_equal ["soup", "south", "something", "some", "sing"], cm.suggest('s')
  end

  def test_select
    cm = CompleteMe.new
    cm.insert('sing')
    cm.insert('some')
    cm.insert('something')
    cm.insert('south')
    cm.insert('soup')

    cm.select('so', 'some')

    assert_equal 1, cm.root.children["s"].children["o"].children['m'].children['e'].weight

  end
end
