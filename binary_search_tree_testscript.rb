require './binary_search_tree'

tree = Tree.new
tree.build_tree(Array.new(15) { rand(1..100)})
puts "Is tree balanced? : #{tree.balanced?}"
puts "Tree elements in level order:"
tree.level_order { |node| puts node.data }
puts "Tree elements in preorder:"
tree.preorder(tree.root, []) { |node| puts node.data }
puts "Tree elements inorder:"
tree.inorder(tree.root, []) { |node| puts node.data }
puts "Tree elements in postorder:"
tree.postorder(tree.root, []) { |node| puts node.data }
tree.rebalance
puts "Tree is now balanced?: #{tree.balanced?}"
