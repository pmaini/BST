clc;
clear all;
close all;
tree = struct([]);
root = 0;

while (true)
    disp('Enter 1 to insert an element');
    disp('Enter 2 to delete an element');
    disp('Enter 3 to search an element');
    disp('Enter 4 to exit an element');
    promptStr = 'Enter your choice: ';
    inputNum = input(promptStr);
    if isempty(inputNum)
        inputNum = 0;
    end
    switch inputNum
        case 1
            promptInsert = 'Enter the number to insert: ';
            insertNum = input(promptInsert);
            [tree,root] = insertNode(tree,root,insertNum);
        case 2
            
        case 3
            promptSearch = 'Enter the number to search: ';
            searchNum = input(promptSearch);
            [nodeIndex path valuePath] = searchTree(tree,root,searchNum);
            tree(nodeIndex)
            disp(num2str(path));
            disp(num2str(valuePath));
            promptMsg = 'Press return to continue...';
            msgNum = input(promptMsg);
        case 4
            return;
        otherwise
    end
end