%start with value 15 collatz:
%15 , 46, 23, 70,35,106 , 53 , 160, 80, 40,stop
% 14,STOP
% 13, STOP
%12 , 6 STOP
% 11 STOP
%10 STOP
%9,28,14,7 STOP
% 8 STOP
% 7,22,11,34,17,52,26,13,40,20,10 STOP
% 6,3 STOP
% 5 STOP
% 4 STOP
% 3,10,5,16,8,4,2 STOP
% 2,1 STOP
% 1 STOP
%smart collatz,to collatz up to 15, takes 21 steps. Notice 21 instances of
%commas! between numbers.

function [] = Collatz(n)

startingNum = 0;
longestSeq = 0;
dynProg = containers.Map(); %%

    for i=1:n
    member = {i};
  
    sequenceCnt = 0;
    firstterm = 0;
    
        while(cell2mat(member) ~= 1)
           if(mod(cell2mat(member),2)==0)
               member = {cell2mat(member) / 2};
               
           else
               member ={ cell2mat(member)*3 + 1};
           end
           
           if(firstterm == 0)
               firstterm = cell2mat(member);
           end
           
           if(isKey(dynProg,member))%%
               sequenceCnt = sequenceCnt + cell2mat(values(dynProg,member));%%
               member = {1};
           end
           
           sequenceCnt = sequenceCnt + 1; 
        end
        
        if(longestSeq < sequenceCnt)
            longestSeq = sequenceCnt;
            startingNum = i;
            
        end
        
        if (not(isKey(dynProg,member)))%%
            dynProg = containers.Map(member,sequenceCnt +1);%%
        end
        
    end
lengthofhash = length(dynProg);
result = longestSeq + lengthofhash;
fprintf('Startnumber: %d ,number of steps taken: %d  \n',n,result);
end