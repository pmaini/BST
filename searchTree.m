function nodeIndex = searchTree(tree,root,value)
%nodeIndex = 0 implies the value is not present in the tree.
if root == 0
    disp('Root not defined')
end

currentNode = root;
valueFound = 0;

while valueFound == 0

    if tree(currentNode).value == value
        nodeIndex = currentNode;
        valueFound = 1;
    elseif tree(currentNode).height == 0
        nodeIndex = 0;
        valueFound = 1;
    elseif value >= tree(currentNode).value
        currentNode = tree(currentNode).rChild;
    else
        currentNode = tree(currentNode).lChild;       
    end
end