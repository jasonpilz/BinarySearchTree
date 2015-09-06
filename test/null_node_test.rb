require_relative '../lib/null_node.rb'

class NullNodeTest < MiniTest::Test

  def test_it_initializes_a_DEFAULT_NullNode
    assert_equal NullNode::DEFAULT, NullNode::DEFAULT
  end
end
