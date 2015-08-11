function [tree,root] = llRotation(tree,root,bugNode,childNode)
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
tree(bugNode).lChild = tree(childNode).rChild;
if (tree(childNode).rChild~=0)
    tree(tree(childNode).rChild).parent = bugNode;
end
tree(childNode).rChild = bugNode;
tree = computeHeight(tree,bugNode);
tree = computeHDiff(tree,bugNode);
tree = computeHeight(tree,tree(childNode).lChild);
tree = computeHDiff(tree,tree(childNode).lChild);