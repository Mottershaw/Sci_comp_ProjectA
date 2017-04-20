%% Learning how to walk in a matix 
clear
clc
N=7;
A=magic(N);

U=zeros(N);
k=N-1;
for i=k:-1:N-k
    N=N-1;
    for j=i:-1:N
        U(i,j)=A(i,j)
    end
    k=k-1
end
