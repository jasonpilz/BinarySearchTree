require_relative '../lib/bst.rb'
require_relative '../lib/null_node.rb'
require_relative '../lib/node.rb'


class BstTest < MiniTest::Test

  def test_if_example_functionality_works
    bst = Bst.new
    bst
        .insert("d")
          .insert("b")
            .insert("a")
            .insert("c")
          .insert("f")
            .insert("e")
            .insert("g")
    assert_equal "d", bst.head.data
    assert_equal

  end


end
