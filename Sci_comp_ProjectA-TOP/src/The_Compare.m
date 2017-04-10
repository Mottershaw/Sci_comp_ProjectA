%Created by Grant Mottershaw

% This will compare the gause to the relazation models 
clear
clc

%% The Guase
node=500;
error=0.1;

x=pi:-(2*pi/(node-1)):-pi;
y=pi:-(2*pi/(node-1)):-pi;


[uG,countG,errorG]=Gause(error,node);


[uR,landa,errorR,lamdaR]=Relax_g(error,node);

U_diff=uG-uR;
figure(3)
surf(x,y,U_diff,'EdgeColor','none')
