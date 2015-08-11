function [tree,root] = lrRotation(tree,root,bugNode,childNode,gChildNode) 
tree(bugNode).lChild = gChildNode;
tree(gChildNode).parent = bugNode;
if (tree(gChildNode).lChild~=0)
    tree.(tree(gChildNode).lChild).parent = childNode;
end
tree(childNode).rChild = tree(gChildNode).lChild;
tree(childNode).parent = gChildNode;
tree(gChildNode).lChild = childNode;
[tree,root] = llRotation(tree,root,bugNode,gChildNode);