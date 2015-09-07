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

  def test_maximum_returns_nil_for_empty_tree
    bst = Bst.empty
    assert_nil bst.maximum_value
  end

  def test_maximum_returns_head_data_for_tree_with_head_node
    @bst.insert(8)
    assert_equal 8, @bst.maximum_value
  end

  def test_maximum_returns_largest_data_in_tree
    @bst.insert("d")
    @bst.insert("b")
    @bst.insert("a")
    @bst.insert("c")
    @bst.insert("f")
    @bst.insert("e")
    @bst.insert("g")
    assert_equal "g", @bst.maximum_value
  end

  def test_minimum_returns_nil_for_empty_tree
    bst = Bst.empty
    assert_nil bst.minimum_value
  end

  def test_minimum_returns_head_data_for_tree_with_head_node
    @bst.insert(9)
    assert_equal 9, @bst.minimum_value
  end

  def test_minimum_returns_smallest_data_in_tree
    @bst.insert(8)
    @bst.insert(4)
    @bst.insert(2)
    @bst.insert(1)
    @bst.insert(3)
    @bst.insert(6)
    @bst.insert(5)
    @bst.insert(7)
    assert_equal 1, @bst.minimum_value
  end

  def test_find_min_node_of_subtree
    @bst.insert(8)
    @bst.insert(12)
    @bst.insert(10)
    @bst.insert(14)
    @bst.insert(9)
    @bst.insert(13)
    @bst.insert(11)
    @bst.insert(15)
    assert_equal @bst.head.right.left.left, @bst.find_min(@bst.head.right)
    assert_equal 9, @bst.find_min(@bst.head.right).data
  end

  def test_depth_of_raises_error_with_empty_tree
    assert_raises "Value not found" do
      bst = Bst.empty
      bst.depth_of(7)
    end
  end

  def test_depth_of_returns_1_for_head_node
    @bst.insert(8)
    assert_equal 1, @bst.depth_of(8)
  end

  def test_depth_of_raises_error_if_value_not_in_tree
    assert_raises "Value not found" do
      @bst.insert(8)
      @bst.insert(4)
      @bst.insert(12)
      @bst.depth_of(5)
    end
  end

  def test_depth_of_returns_2_for_second_layer_of_tree
    @bst.insert(8)
    @bst.insert(4)
    @bst.insert(12)
    assert_equal 2, @bst.depth_of(4)
    assert_equal 2, @bst.depth_of(12)
  end

  def test_depth_of_returns_level_lower_in_tree
    @bst.insert(4)
    @bst.insert(5)
    @bst.insert(6)
    @bst.insert(5.5)
    @bst.insert(7)
    @bst.insert(8)
    assert_equal 4, @bst.depth_of(5.5)
    assert_equal 4, @bst.depth_of(7)
    assert_equal 5, @bst.depth_of(8)
  end

  def test_sort_returns_empty_array_when_tree_empty
    bst = Bst.empty
    assert_equal [], bst.sort
  end

  def test_sort_returns_1_element_array_from_tree_with_head
    @bst.insert(5)
    assert_equal [5], @bst.sort
  end

  def test_sort_returns_sorted_array_of_tree
    @bst.insert(4)
    @bst.insert(5)
    @bst.insert(6)
    @bst.insert(5.5)
    @bst.insert(7)
    @bst.insert(8)
    assert_equal [4, 5, 5.5, 6, 7, 8], @bst.sort
  end

  def test_delete_raises_error_with_empty_tree
    assert_raises "Value not found" do
      bst = Bst.empty
      bst.delete(9)
    end
  end

  def test_can_delete_node_with_2_children_from_tree
    skip
    @bst.insert("d")
    @bst.insert("b")
    @bst.insert("a")
    @bst.insert("c")
    @bst.insert("f")
    @bst.insert("e")
    @bst.insert("g")
    @bst.delete("b")
    assert_equal "c", @bst.head.left.data
  end
end
