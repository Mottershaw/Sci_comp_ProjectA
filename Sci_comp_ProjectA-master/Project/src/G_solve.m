function [ u ] = G_solve( Do )
%G_slove will solve the given matrix for F(x,y) with the bouandry
%conditions already containted inside the matrix. 

%   INPUTS
    % Do =Matrix with boundary conditions. 
    
%OUTPUTS
    % Sol_Do=Solution 

[n,m]=size(Do);

u=Do;
dx=1/(m-1);
dy=1/(m-1);


%Implicit method
for n=n-1:-1:2
    for m=2:1:m-1
        
        A=(dx^2+dy^2)/(dy^2*dx^2)
        F=1; % this wll be an equasion
        AA=(1/dx^2)*(u(n-1,m)+u(n+1,m))
        BB=(1/dy^2)*(u(n,m+1)+u(n,m-1))
        u(n,m)=A*(F-AA-BB);
    end
end    

u=Do;

end

