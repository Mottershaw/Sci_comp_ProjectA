%Created by Grant Mottershaw

% This will compare the gause to the relazation models 
clear
clc

%% The Guase
node=100;
error=0.2;

x=pi:-(2*pi/(node-1)):-pi;
y=pi:-(2*pi/(node-1)):-pi;


[uG,countG,errorG]=Gause(error,node);


[uR,landa,errorR,lamdaR]=Relax_g(error,node);

U_diff=abs(uG-uR);

figure(1)
surf(x,y,uG,'EdgeColor','none')
title('Gause')

figure(2)

surf(x,y,uR,'EdgeColor','none')
title('Relaxed Plot')


figure(3)
surf(x,y,U_diff,'EdgeColor','none')
title('The Difference between the 2')


