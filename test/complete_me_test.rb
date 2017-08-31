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
    cm.insert("cat")
    assert cm.root.children["c"], Node
    # assert cm.root.children["c"].children, instance of Node with value "a"
    # assert cm.root.children["c"].children["a"], instance of Node with value "t"
    refute cm.root.children["a"]
    refute cm.root.children["t"]
  end
end
