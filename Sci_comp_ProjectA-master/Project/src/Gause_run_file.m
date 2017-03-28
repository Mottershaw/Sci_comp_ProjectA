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
n=8;
m=n;
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
    r=Do(1,end);
    Do(:,m)=g+(y-ay)/(by-ay)*(r-g);
Do_boundary=Do; 
%% So I are going to try and solve this
r=single(zeros((m*n),1));

dx=1/(n-1);
dy=1/(m-1);

for i=1:m-1
      for j=1:n-1
        X=dx*i;
        Y=dy*j;
        r(i*j)=sin(pi*(X-ax)/(bx-ax))*cos(pi/2*(2*(Y-ay)/(by-ay)+1)); 
      end
end

f=ones(1,n)
e=ones
%U=Tridiag(

