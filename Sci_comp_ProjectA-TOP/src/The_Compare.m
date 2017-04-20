%% Comparing the 2 Different solution Types. 

%Created by Grant Mottershaw

% This will compare the Gause to  Relaxatuin solutions.  
clear
clc
%% Imput and Bounds
nodes=100;
Max_error=0.00001;

x=pi:-(2*pi/(nodes-1)):-pi;
y=pi:-(2*pi/(nodes-1)):-pi;
%% The Gause Approximation
Lambda_g_in=1;
[uG,countG,errorG]=Relax_g(Max_error,nodes,Lambda_g_in);
[uRG,countRG,errorGR]=RG_2(Max_error,nodes,Lambda_g_in);

%% The Relaxation Approximation
Lambda=1.2;
[uR,countR,errorR]=Relax_g(Max_error,nodes,Lambda);
[uRR,countRR,errorRR]=RG_2(Max_error,nodes,Lambda);

%% Making the table so we can adjust
SolvingTypes={'Gause';'Relaxation';'test G';'test R'};
SolveCycles=[countG;countR;countRG;countRR];
Real_Error=[errorG;errorR;errorGR;errorRR];
Lambda_Real=[1;Lambda;1;Lambda];

T=table(SolveCycles,Real_Error,Lambda_Real,'RowNames',SolvingTypes)

Gause_diff=max(max(abs(uG-uRG)))
Relax_diff=max(max(abs(uR-uRR)))

H=[0;0;(countRG/countG)*100;(countRR/countR)*100];
Faster=table(SolveCycles,H,'RowNames',SolvingTypes)

%U_diff=abs(uG-uR);

%Precent_Faster=(1-countR/countG)*100

%Max_Diff=max(max(U_diff))

%% Graphs for the solution 
% figure(1)
% surf(x,y,uG,'EdgeColor','none')
% title('Gause')
% 
% figure(2)
% surf(x,y,uR,'EdgeColor','none')
% title('Relaxed Plot')
% 
% figure(3) % The Difference between the solutions
% surf(x,y,uRR,'EdgeColor','none')
% title('The Difference between the 2')