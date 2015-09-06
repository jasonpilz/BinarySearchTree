require_relative 'node.rb'
require_relative 'null_node.rb'

class Bst
  attr_accessor :head

  def initialize(head=nil) # TODO Should I use NullNode::DEFAULT)?
    if head != nil
      @head = wrap_in_node(head)
    else
      @head = head
    end
  end

  def wrap_in_node(data)
    Node.new(data)
  end

  def self.empty
    new
  end

  def insert(data, current=@head)
    if current == nil
      @head = wrap_in_node(data)
      return
    end

    if data <= current.data
      if current.left == NullNode::DEFAULT
        current.left = wrap_in_node(data)
      else
        insert(data, current.left)
      end
    else data > current.data
      if current.right == NullNode::DEFAULT
        current.right = wrap_in_node(data)
      else
        insert(data, current.right)
      end
    end
  end

  # def delete(value) # Delete a value from the tree and repair the tree
  #
  # end
  #
  # def include? # Verify/Reject the precense of a value in the tree
  #
  # end
  #
  # def depth_of(value) # Report the depth of a node in the tree
  #
  # end
  #
  # def maximum # Find the maximun value in the tree
  #
  # end
  #
  # def minimum # Find the mininum value in the tree
  #
  # end
  #
  # def sort # Outputs an array of the values in sorted order
  #
  # end

###### EXTENSIONS ######

  
end



bst = Bst.new(4)

# Bst.new(Node.new(4))
