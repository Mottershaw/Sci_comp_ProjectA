%% Comparing the 2 Different solution Types. 

%Created by Grant Mottershaw

% This will compare the Gause to  Relaxatuin solutions.  
clear
clc
%% Imput and Bounds
nodes=10;
Max_error=0.1;

x=pi:-(2*pi/(nodes-1)):-pi;
y=pi:-(2*pi/(nodes-1)):-pi;
%% The Gause Approximation
Lambda_g_in=1;
[uG,countG,errorG]=Relax_g(Max_error,nodes,Lambda_g_in);

%% The Relaxation Approximation
Lambda=1.216;
[uR,countR,errorR,lamdaR]=Relax_g(Max_error,nodes,Lambda);

%% Making the table so we can adjust
SolvingTypes={'Gause';'Relaxation'};
SolveCycles=[countG;countR];
Real_Error=[errorG;errorR];
Lambda_Real=[Lambda_g_in;lamdaR];

T=table(SolveCycles,Real_Error,Lambda_Real,'RowNames',SolvingTypes)

U_diff=abs(uG-uR);

Precent_Faster=(1-(countR/countG))*100

Max_Diff=max(max(U_diff))

%% Graphs for the solution 
figure(1)
surf(x,y,uG,'EdgeColor','none')
title('Gause')

figure(2)
surf(x,y,uR,'EdgeColor','none')
title('Relaxed Plot')

figure(3) % The Difference between the solutions
surf(x,y,U_diff,'EdgeColor','none')
title('The Difference between the 2')