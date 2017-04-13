%% Created by Grant Mottershaw
% 3/19/2017
clear
clc
%% Defining the domain of intrest
% X Boundarys  
ax=pi;
bx=-pi;
% Y Boundarys 
ay=pi;
by=-pi;
%% The boundry 
n=200;
m=n;
%Domain 
Do=ones(n,m)*0.00001;
x=pi:-(2*pi/(m-1)):-pi;
y=pi:-(2*pi/(n-1)):-pi;
% TOP 
    g=x.*(x-ax).^2;
    Do(1,:)=g;   
%Bottom
    f=(x-ax).^2.*cos((pi.*x)./ax);
    Do(n,:)=f;
%Right hand vertical
%     g=Do(n,end);
%     f=Do(1,end);
    Do(:,m)=g+(y-ay)/(by-ay).*(f-g);
%left hand verical
   % Neuman boundary Condition
u=Do;
figure(1)
surf(x,y,u,'EdgeColor','none')
%% the solve
F=zeros(n);
%% The function we have to have at every point 
for i=2:1:n-1
        for j=2:1:m-1
           F(i,j)=sin((pi*(x(i)-ax)/(bx-ax)))*cos((pi/2)*(2*(y(j)-ay)/(by-ay)-1));
        end
end
%% solving the PDE
lamda=0; % to stop the while loop

% These are used to help count the error for each cycle. 
u1=0;
u2=0;

lamda=1.1;
count=0;
error=100; % Becasue we have not solved it yet the Error is a baseline of 100%

% It will solve untill the error Max error is below the specified value. 

while error > 0.01 
    
    lamda=lamda+0.0035;
   
    u1=u; % the value before they run though the system 
    for i=2:1:n-1
        for j=2:1:m-1
           u(i,j)=1/4*(u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j+1)+F(i,j));
            % The diagonals on the square around the point 
            u(i,j)=1/4*(u(i+1,j+1)+u(i+1,j-1)+u(i-1,j+1)+u(i-1,j+1))+F(i,j);     
        end
    end
u2=u;   % the values after they are calclated. 

error=max(max(abs((u1-u2)./u2)))*100;

u=u2*lamda+(1-lamda)*u1;

count=count+1;

if count== 2000
    break
end
end
%% The Results 
    
error=max(max(abs((u1-u2)./u2)))*100
count
%count=(lamda-1)*1000;
figure(2)
surf(x,y,u,'EdgeColor','none')
