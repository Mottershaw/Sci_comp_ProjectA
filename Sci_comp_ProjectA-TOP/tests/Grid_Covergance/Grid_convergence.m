%% Grid convergence

% Created by Grant Mottershaw
% 4/23/2017

% This will demonstrait that we are converging to the a soltion as our
% resolution increses 

clear
clc
%% Imput and Bounds

load('G_grid_750');

uG_A=uG;

load('G_grid_1500');
uG_B=uG;

load('R_grid_750')
uR_A=uR;

load('R_grid_1500');
uR_B=uR;


%% Calulating the convergence

nodes=[length(uG_A),length(uG_B)];

count=ceil(max(nodes)/min(nodes))
nodes_SM=min(nodes);
M=2; N=2;

U_diff_G=zeros(nodes_SM); 
U_diff_R=zeros(nodes_SM); 

for i=2:1:nodes_SM-count
     for j=2:1:nodes_SM-count
         U_diff_G(i,j)=abs(uG_A(i,j)-uG_B(N,M));
         U_diff_R(i,j)=abs(uR_A(i,j)-uR_B(N,M));
         M=M+count;
     end
     M=1; N=N+count;
end

AVG_diff_G=mean(mean((U_diff_G)))
AVG_diff_R=mean(mean((U_diff_G)))


figure(1)
surf(U_diff_G,'EdgeColor','none')
title('Gause')
% 
figure(2)
surf(U_diff_R,'EdgeColor','none')
title('Relaxed')