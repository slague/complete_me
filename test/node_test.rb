require 'minitest/autorun'
require_relative '../lib/node'
require 'minitest/pride'



class NodeTest < Minitest::Test

  def test_node_exists
    node = Node.new("c")
    assert node
    assert "c", node.value
  end

end
