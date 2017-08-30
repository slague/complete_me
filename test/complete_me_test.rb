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

  end
end
