require_relative '../lib/bst.rb'


@bst = Bst.new
@bst.insert("d")
@bst.insert("b")
@bst.insert("a")
@bst.insert("c")
@bst.insert("f")
@bst.insert("e")
@bst.insert("g")
@bst.export_data_to_file("./output.txt")
