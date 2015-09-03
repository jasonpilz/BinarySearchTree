
class Node

  def initialize(data, left, right)
    @data = data
    @left = left
    @right = right
  end

  def delete(data)
    if data == @data
      NullNode::DEFAULT if data == @data # TODO what about children nodes
      if data < @data
        @left = left.delete(data)
      else
        @right = right.delete(data)
      end
      self

  end

end
