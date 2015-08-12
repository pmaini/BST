function [tree,root] = rlRotation(tree,root,bugNode,childNode,gChildNode)
tree(bugNode).rChild = gChildNode;
tree(gChildNode).parent = bugNode;
if (tree(gChildNode).rChild~=0)
    tree.(tree(gChildNode).rChild).parent = childNode;
end
tree(childNode).lChild = tree(gChildNode).rChild;
tree(childNode).parent = gChildNode;
tree(gChildNode).rChild = childNode;
[tree,root] = rrRotation(tree,root,bugNode,gChildNode);