function node = createNewNode(value)
node = struct;
node.name = 0;
node.value = value;
node.parent = 0;
node.lChild = 0;
node.rChild = 0;
node.height = 0;
%difference between the height of left and right child
node.hDiff = 0;