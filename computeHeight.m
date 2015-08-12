function tree = computeHeight(tree,nodeID)
%updates the hDiff (height difference) for all nodes on the path 
%from root to nodeID

while (nodeID~=0)    
    lCode = 0;
    rCode = 0;
    if tree(nodeID).lChild == 0
        lCode = 1;
    end
    if tree(nodeID).rChild == 0
        rCode = 1;
    end

    code = (rCode*10) + lCode;

    switch code
        case 11
            tree(nodeID).height = 0;
        case 1
            tree(nodeID).height = tree(tree(nodeID).rChild).height + 1;
        case 10
            tree(nodeID).height = tree(tree(nodeID).lChild).height + 1;
        case 0
            tree(nodeID).height = max(tree(tree(nodeID).lChild).height, ... 
                tree(tree(nodeID).rChild).height) + 1;
    end
    nodeID = tree(nodeID).parent;
end