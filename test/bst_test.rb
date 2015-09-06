require_relative '../lib/bst.rb'
require_relative '../lib/null_node.rb'
require_relative '../lib/node.rb'


class BstTest < MiniTest::Test

  def setup
    @bst = Bst.new
  end

  def test_example_functionality_works
    @bst.insert("d")
    @bst.insert("b")
    @bst.insert("a")
    @bst.insert("c")
    @bst.insert("f")
    @bst.insert("e")
    @bst.insert("g")
    assert_equal "d", @bst.head.data
    assert_equal "b", @bst.head.left.data
    assert_equal "f", @bst.head.right.data
    assert_equal "a", @bst.head.left.left.data
    assert_equal "g", @bst.head.right.right.data
    assert_equal "c", @bst.head.left.right.data
    assert_equal "e", @bst.head.right.left.data
    assert_equal NullNode, @bst.head.left.left.left.class
    assert_equal NullNode, @bst.head.left.left.right.class
  end

  def test_empty_tree_has_nil_as_head
    bst = Bst.empty
    assert_nil bst.head
  end

  def test_empty_tree_can_internally_wrap_intitial_value_in_node
    bst = Bst.new(5)
    assert_equal NullNode::DEFAULT, bst.head.left
    assert_equal NullNode::DEFAULT, bst.head.right
    assert_equal 5, bst.head.data
    assert_equal Node, bst.head.class
  end

  def test_can_insert_data_into_empty_tree
    bst = Bst.empty
    bst.insert(8)
    assert_equal 8, bst.head.data
  end

  def test_can_insert_smaller_data_to_left_of_head_node
    @bst.insert(3)
    @bst.insert(2)
    assert_equal 3, @bst.head.data
    assert_equal 2, @bst.head.left.data
    assert_equal NullNode, @bst.head.right.class
  end

  def test_can_insert_larger_data_to_right_of_head_node
    @bst.insert(4)
    @bst.insert(5)
    assert_equal 5, @bst.head.right.data
  end

  def test_can_insert_equal_data_as_head_node_to_left_of_head_node
    @bst.insert(7)
    @bst.insert(7)
    assert_equal 7, @bst.head.left.data
    assert_equal 7, @bst.head.data
  end

  def test_can_continue_inserting_lesser_data_down_left_of_tree
    @bst.insert(4)
    @bst.insert(3)
    @bst.insert(2)
    assert_equal 2, @bst.head.left.left.data
  end

  def test_can_continue_inserting_larger_data_down_right_of_tree
    @bst.insert(4)
    @bst.insert(5)
    @bst.insert(6)
    assert_equal 6, @bst.head.right.right.data
  end

  def test_include_returns_false_for_an_empty_tree
    assert_equal false, @bst.include?(5)
  end

  def test_include_returns_true_for_data_of_head_node
    @bst.insert(4)
    assert_equal true, @bst.include?(4)
    assert_equal false, @bst.include?(5)
  end

  def test_include_returns_true_for_data_lower_in_the_tree
    @bst.insert(6)
    @bst.insert(3)
    @bst.insert(3456)
    @bst.insert(143)
    assert_equal true, @bst.include?(3456)
    assert_equal true, @bst.include?(143)
    assert_equal true, @bst.include?(3)
    assert_equal false, @bst.include?(543)
  end

  def test_include_returns_false_for_no_data_match_found
    @bst.insert("Joe")
    @bst.insert("Bob")
    @bst.insert("Jimmy")
    @bst.insert("Larry")
    assert_equal false, @bst.include?("Bobby")
    assert_equal false, @bst.include?("Jim")
    assert_equal true, @bst.include?("Jimmy")
  end
end
