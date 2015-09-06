require_relative '../lib/node.rb'

class NodeTest < MiniTest::Test

  def test_it_has_data
    node1 = Node.new(4)
    assert_equal 4, node1.data
  end

  def test_it_has_a_left_NullNode_by_default
    assert_equal NullNode::DEFAULT, Node.new(1).left
  end

  def test_it_has_a_right_NullNode_by_default
    assert_equal NullNode::DEFAULT, Node.new(2).right
  end

  def test_its_left_node_has_data
    assert_equal 4, Node.new(2, Node.new(4)).left.data
  end

  def test_it_has_a_right_NullNode_by_default
    assert_equal NullNode::DEFAULT, Node.new(3).right
  end

  def test_its_right_node_has_data
    assert_equal 5, Node.new(4, nil, Node.new(5)).right.data
  end
end
