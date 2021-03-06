function [tree,root] = insertNode(tree,root,value)
%The tree is stored in a struct array. The root pointer and 
%node values are used to traverse the node.

if ~isempty(tree)
    [valueIndex,~,~] = searchTree(tree,root,value);
    if valueIndex ~= 0
        disp(['Value already exists at index: ' num2str(valueIndex)]); 
        promptMsg = 'Press return to continue...';
        msgInput = input(promptMsg);
        return;
    end
end
newNode = createNewNode(value);
treeSize = size(tree,2);
treeSize = treeSize+1;
if (treeSize == 1)
   newNode.name = 1;
   tree = newNode;
   root = 1;
   return;
end
tree(treeSize) = newNode;
tree(treeSize).name = treeSize;
currentNode = tree(root);
locationFound = 0;

%right child : child == 2, left child : child == 1 
while (locationFound == 0)
    if newNode.value >= currentNode.value
        if currentNode.rChild == 0 
           parent = currentNode.name;
           child = 2;
           locationFound = 1;
        else
           currentNode = tree(currentNode.rChild);
        end
    else        
        if currentNode.lChild == 0 
           parent = currentNode.name;
           child = 1;
           locationFound = 1;           
        else
           currentNode = tree(currentNode.lChild);
        end
    end
end

tree(treeSize).parent = parent;
if child == 2
    tree(parent).rChild = treeSize;
elseif child == 1
    tree(parent).lChild = treeSize;
end

tree = computeHeight(tree,parent);
tree = computeHDiff(tree,parent);
[tree, root] = balanceTree(tree, root, tree(treeSize).name); 