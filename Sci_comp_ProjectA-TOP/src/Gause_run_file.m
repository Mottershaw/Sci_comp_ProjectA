%% Created by Grant Mottershaw
% 3/19/2017
clear
clc
%% this is where the code starts

%% Defining the domain of intrest

ax=pi;
bx=-pi;

ay=pi;
by=-pi;

%% The boundry 
n=19;
m=n;
Do=zeros(n,m);

%Top
    x=pi:-(2*pi/(m-1)):-pi;
    Do(1,:)=x.*(x-ax).^2;   
%Bottom
    Do(n,:)=(x-ax).^2.*cos((pi.*x)./ax);

%Left hand vertical
     y=pi:-(2*pi/(n-1)):-pi;
     
     %Do(:,1)=5;
%left hand verical
    g=Do(n,end);
    f=Do(1,end);
    Do(:,m)=g+(y-ay)/(by-ay)*(f-g);
u=Do;
figure(1)
surf(u)
%% So we are going to try and solve this

f=4*ones(1,n^2-1);
g=-1*ones(1,n^2);
e=1*ones(1,n^2);

dx=1/(n-1);
dy=dx;

r=zeros(1,n^2);

 for i=2:1:n-1
        for j=2:1:m-1
            F(i,j)=sin(i);
        end
    end

%for a=1:9
    for i=2:1:n-1
        for j=2:1:m-1
            u(i,j)=1/4*u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j+1)+F(i,j);
        end
    end
%end

figure(2)
surf(u)

%% assenbley in to graphable plot. 

% g=sqrt(length(u)+1);
% U_1=zeros(g);
% 
% for i=1:1:g
%     for j=1:1:g
%         U_1(i,j)=u(i+j);
%     end
% end
% 
% dlmwrite('work.txt',U_1)
% 
% surf(U_1)
% 
% 

