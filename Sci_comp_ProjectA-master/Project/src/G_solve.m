function [ Sol_Do ] = G_solve( Do )
%G_slove will solve the given matrix for F(x,y) with the bouandry
%conditions already containted inside the matrix. 

%   INPUTS
    % Do =Matrix with boundary conditions. 
    
%OUTPUTS
    % Sol_Do=Solution 

[n,m]=size(Do);

Sol_Do=Do;
dx=1/(m-1);
dy=1/(m-1);


%Implicit method
for n=n-1:-1:2
    for m=2:1:m-1
        X=(Do(n-1,m-1)+2*Do(n-1,m)+Do(n-1,m+1))/(dx^2);
        Y=(Do(n+1,m-1)+2*Do(n,m-1)+Do(n-1,m-1))/(dy^2);
        Do(n,m)=-(X+Y);
    end
end    

Sol_Do=Do;

end

