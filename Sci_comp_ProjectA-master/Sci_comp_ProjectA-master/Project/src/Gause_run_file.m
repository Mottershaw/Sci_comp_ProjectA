%% Created by Grant Mottershaw
% 3/19/2017
clear
clc
%% this is where the code starts

% Defining the domain of intrest

ax=pi;
bx=-pi;

ay=pi;
by=-pi;

%% Boundry equasions 


%% The boundry 
n=10;
m=20;
Do=zeros(n,m);

%Top
    x=pi:-(2*pi/(m-1)):-pi;
    Do(1,:)=x.*(x-ax).^2;   
%Bottom
    Do(n,:)=(x-ax).^2.*cos((pi.*x)./ax);
     clear x % TO CLEAN UP RAM

%Left hand vertical
     y=pi:-(2*pi/(n-1)):-pi;
     
     %Do(:,1)=5;
%left hand verical
    g=Do(n,end);
    f=Do(1,end);
    Do(:,m)=g+(y-ay)/(by-ay)*(f-g);
Do_boundary=Do; 
figure(1)
surf(Do_boundary)
%% So we are going to try and solve this

U=G_solve(Do)



figure(2)
surf(U)
    

