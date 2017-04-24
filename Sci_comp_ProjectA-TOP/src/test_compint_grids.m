%% I am going to try and compare the value form 2 different grids  


clear
clc
nodes=10;

U_1=ones(nodes);
U_2=18*ones(2*nodes);

U_diff=zeros(nodes);
M=1
N=1
for i=1:1:nodes
     for j=1:1:nodes
         U_diff(i,j)=U_1(i,j)-U_2(M,N);
         M=M+2;
     end
     M=1;
     N=N+1;
   
end

U_diff