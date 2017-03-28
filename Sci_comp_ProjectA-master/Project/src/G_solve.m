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

u=tridiag(e,f,g,r)

u=Do;

end

