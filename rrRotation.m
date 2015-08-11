function [tree,root] = rrRotation(tree,root,bugNode,childNode)
if tree(bugNode).parent ~= 0
    if (tree(tree(bugNode).parent).lChild == tree(bugNode).name)
        tree(tree(bugNode).parent).lChild = childNode;
    else
        tree(tree(bugNode).parent).rChild = childNode;
    end
else
     root = childNode;
end
tree(childNode).parent = tree(bugNode).parent;
tree(bugNode).parent = childNode;
tree(bugNode).rChild = tree(childNode).lChild;
tree(tree(childNode).lChild).parent = bugNode;
tree(childNode).lChild = bugNode;
tree = computeHeight(tree,bugNode);
tree = computeHDiff(tree,bugNode);
tree = computeHeight(tree,childNode);
tree = computeHDiff(tree,childNode);