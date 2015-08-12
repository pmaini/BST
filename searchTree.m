function [nodeIndex path valuePath] = searchTree(tree,root,value)
%return value for nodeIndex = 0 implies the value is not present
%in the tree.

if isempty(tree)
    disp('Tree is empty.')
    return;
end
if root == 0
   disp('Root not defined.')
   return;
end

currentNode = root;
path = currentNode;
valuePath = tree(currentNode).value;
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
        path = [path currentNode];
        valuePath = [valuePath tree(currentNode).value];       
    else
        currentNode = tree(currentNode).lChild;
        path = [path currentNode];
        valuePath = [valuePath tree(currentNode).value];       
    end
end