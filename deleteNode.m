function [tree,root] = deleteNode(tree,root,value)

nodeIndex = searchTree(tree,root,value);
if nodeIdex == 0
   msgbox('Value does not exist'); 
end

lCode = 0;
rCode = 0;
if tree(nodeIndex).lChild == 0
    lCode = 1;
elseif tree(nodeIndex).rChild == 0
    rCode = 1;
end

code = (rCode*10) + lCode;
nextFound = 0;
nextNode = 0;

switch code
    case 11        
        nextFound = 1;
        nextNode = 0;
    case 1
        nextFound = 1;
        nextNode = tree(nodeIndex).rChild;
        nextType = 'min';
    case 10
        nextFound = 1;
        nextNode = tree(nodeIndex).lChild;
        nextType = 'max';
    case 0
        nextFound = 0;
        currentNode = tree(nodeIndex).rChild;
        nextType = 'min';
end

if ((nextFound == 1)&&(nextNode == 0))
    %no replacement
elseif (nextFound == 0)
    while (nextFound == 0)
       if tree(currentNode).lChild == 0
            nextFound = 1;
       else
            currentNode = tree(currentNode).lChild;       
       end
    end
    nextNode = currentNode;
end

if tree(nodeIndex).parent ~= 0
    if tree(tree(nodeIndex).parent).rChild == nodeIndex
        tree(tree(nodeIndex).parent).rChild = nextNode;
    else
        tree(tree(nodeIndex).parent).lChild = nextNode;
    end
else
    root = nextNode;
end
% if ((tree(nextNode).parent ~= 0) && ...
if ((tree(nextNode).parent ~= nodeIndex))
%if the parent is nodeIndex, implies nextNode is the right child.
%if the condition evaluates to false there is no need to do anything
    tree(tree(nextNode).parent).lChild = tree(nextNode).rChild;
    %necessary to update the lChild as done above even if its '0'
    if (tree(nextNode).rChild~=0)
        tree(tree(nextNode).rChild).parent = tree(nextNode).parent;
    end
end
tree(nextNode).parent = tree(nodeIndex).parent;
tree(nextNode).lChild = tree(nodeIndex).lChild;
if tree(nodeIndex).lChild ~= 0
    tree(tree(nodeIndex).lChild).parent = nextNode;
end
if (tree(nodeIndex).rChild ~= nextNode)
    tree(nextNode).rChild = tree(nodeIndex).rChild;
    if (tree(nodeIndex).rChild ~= 0)
        tree(tree(nodeIndex).rChild).parent = nextNode;
    end
end
