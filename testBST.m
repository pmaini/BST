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
    switch inputNum
        case 1
            promptInsert = 'Enter the number to insert: ';
            insertNum = input(promptInsert);
            [tree,root] = insertNode(tree,root,insertNum);
        case 2
            
        case 3
            
        case 4
            
    end
end