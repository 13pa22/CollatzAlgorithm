%DUMB implementation of Collatz(1000), each value up to 1000 is individually
%collatz'd and there is no learning from previous runs of Collatz that
%would help higher values learn when to stop early.
function [] = Main(n)
a = linspace(1,n,n);
b = 1:n;
count =0;
for i=1:n
    nc = DumbCollatz(i); 
    fprintf('for value %d , number of steps is:%d \n',i,nc);
    
    count = count + nc;
    b(i) = nc;
end 
fprintf('total number of steps taken to fully "Collatz" all values is:%d \n',count);
plot(a,b);
title('Dumb Version of Collatz, number of steps plotted as a function of each n');
xlabel('N values');
ylabel('number of steps taken');
end 

