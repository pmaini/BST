function [tree,root] = rlRotation(tree,root,bugNode,childNode,gChildNode)
tree(bugNode).rChild = gChildNode;
tree(gChildNode).parent = bugNode;
tree.(tree(gChildNode).rChild).parent = childNode;
tree(childNode).lChild = tree(gChildNode).rChild;
tree(childNode).parent = gChildNode;
tree(gChildNode).rChild = childNode;
[tree,root] = rrRotation(tree,root,bugNode,gChildNode);