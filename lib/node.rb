require_relative 'null_node'

class Node
  attr_accessor :data, :left, :right

  def initialize(data, left=NullNode::DEFAULT, right=NullNode::DEFAULT)
    @data = data
    @left = left
    @right = right
  end
end
