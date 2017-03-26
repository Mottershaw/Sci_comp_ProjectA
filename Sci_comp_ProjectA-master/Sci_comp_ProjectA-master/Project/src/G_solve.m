function [ u ] = G_solve( Do )
%G_slove will solve the given matrix for F(x,y) with the bouandry
%conditions already containted inside the matrix. 

%   INPUTS
    % Do =Matrix with boundary conditions. 
    
%OUTPUTS
    % Sol_Do=Solution 

[n,m]=size(Do);

u=Do;
dx=1/(n-1);
dy=1/(m-1);


y=(-pi)+(2*pi*m*dx);

%Implicit method
for n=n-1:-1:2
    for m=2:1:m-1
        
        % These are the componts of the solution
        A=(dy^2*dx^2)/(dx^2+dy^2);
        
        % The function
        x=-pi+(2*pi*m*dx);
        y=-pi+(2*pi*n*dy);
        
        F=sin((x+pi)/2)*cos((y+pi)/2+pi/2); % this wll be an equasion
        AA=(1/dx^2)*(u(n-1,m)+u(n+1,m));
        BB=(1/dy^2)*(u(n,m+1)+u(n,m-1));
        u(n,m)=A*(F-AA-BB);
    end
end    

u;

end

