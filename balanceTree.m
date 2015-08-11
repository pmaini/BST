function [tree,root] = balanceTree(tree,root,newNodeID)
%Find the smallest ancestor of the newNode that has hDiff > 1.
%Let's call this ancestor as uNode (unbalanced Node)
%
%Check which of the following two cases are true:
%1. The uNode has a lChild which is also left heavy 
%(symmatrically right), ll rotation (symmetrically rr)    
%2. The uNode has a lChild which is right heavy 
%(symmetrically right), lr rotation (symmetrically rl)

bugFound = 0;
currentNode = newNodeID;

while bugFound == 0 
    if tree(currentNode).hDiff > 1
        bugFound  = 1;
    elseif tree(currentNode).parent == 0
        disp('This tree is already balanced')
        return
    else        
        currentNode = tree(currentNode).parent;
    end
end

bugNode = currentNode;

if tree(bugNode).lChild == 0
    currentNode = tree(bugNode).rChild;
    child = 2;
elseif tree(bugNode).rChild == 0
    currentNode = tree(bugNode).lChild;
    child = 1;
elseif (tree(tree(bugNode).rChild).height > ... 
        tree(tree(bugNode).lChild).height)
    currentNode = tree(bugNode).rChild;
    child = 2;
else
    currentNode = tree(bugNode).lChild;
    child = 1;
end
   
childNode = currentNode;

if tree(childNode).lChild == 0
    currentNode = tree(childNode).rChild;
    gChild = 2;
elseif tree(childNode).rChild == 0
    currentNode = tree(childNode).lChild;
    gChild = 1;
elseif (tree(tree(childNode).rChild).height > ... 
        tree(tree(childNode).lChild).height)
    currentNode = tree(childNode).rChild;
    gChild = 2;
else
    currentNode = tree(childNode).lChild;
    gChild = 1;
end

gChildNode = currentNode;

code = 10*child + gChild;
switch code
     case 11
         [tree,root] = llRotation(tree,root,bugNode,childNode);         
     case 12
         [tree,root] = lrRotation(tree,root,bugNode,childNode,gChildNode);
     case 21
         [tree,root] = rlRotation(tree,root,bugNode,childNode,gChildNode);
     case 22   
         [tree,root] = rrRotation(tree,root,bugNode,childNode);
     otherwise
         disp('None of ll, rr, lr, rl rotations applicable.')
end