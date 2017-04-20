%%

clear
clc
%%
N=7

A=zeros(N);

count=0
    
    for i=N-1:-1:2
        for j=N-1:-1:2
            
            
            A(i,j)=5%
            A(j,i)=6;
            count=count+1;
        end
    end
    count