function [ u,count,error,lamda ] = RG_2( max_error,nodes,lamda_Start )
%This will slove the APc2-2 for using Gause approximatio 
%   Relax_g will return the solution

%% Inputs 
% error == the ammount of error that you want
% nodes == how fine you want the mesh for the square we are looking at
% lamda_Start == were you want the relaxation to start at. 

%% Outputs
% u == solution 
% Count == how many cycle the solution took to solve
% lamda == the Final Lamda for the solution 
%% Defining the domain of intrest
% X Boundarys  
ax=pi;
bx=-pi;
% Y Boundarys 
ay=pi;
by=-pi;
%% The domain 
n=nodes; m=n;
%Domain 
Do=ones(n,m)*0.00001;

dx=(2*pi/(m-1));
x=-pi:(dx):pi;
y=-pi:(dx):pi;

%%

% TOP 
    f=x.*(x+pi).^2;
%Bottom
    
     g=(x+pi).^2.*cos(-x); 
    %Do(n,:)=f;
%Right hand vertical
%     g=Do(n,end);
%     f=Do(1,end);
    h=g(end)+((y+pi)/(2*pi))*(f(end)-g(end));
%left hand verical
   % Neuman boundary Condition
    Do(:,1)=0;
    
%% Boundaries

Do(1,:)=fliplr(f); % TOP
Do(:,n)=g;% BOTTOM
Do(:,1)=0; % RIGHT
Do(m,:)=fliplr(h); % LEFT

u=Do;
%     figure(7)
%     surf(u)
%     surf(x,y,u,'EdgeColor','none')
%% the solve
F=zeros(n);
%% The function we have to have at every point 
for i=2:1:n-1
        for j=2:1:m-1
           F(i,j)=sin((pi*(x(i)-ax)/(bx-ax)))*cos((pi/2)*(2*(y(j)-ay)/(by-ay)-1));
        end
end
%% solving the PDE

% These are used to help count the error for each cycle. 
u1=0;
u2=0;
% Where we start counting with Lamda
lamda=lamda_Start;
% The scaling ammount for how lamda is helped 
%L_add=1/sqrt(nodes);
count=0;
error=100; % Becasue we have not solved it yet the Error is a baseline of 100%

% It will solve untill the error Max error is below the specified value. 

while error > max_error
    %% Solving for U matrix 
    
    u(:,1)=u(:,2)*2*dx;   
    u1=u; % the value before they run though the system 

    for i=2:1:n-1
        for j=2:1:m-1
           u(i,j)=0.25*(u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j+1)+(F(i,j)*dx^2));
           u(j,i)=0.25*(u(j+1,i)+u(j-1,i)+u(j,i+1)+u(j,i+1)+(F(j,i)*dx^2));
        end
    end
u2=u;   % the values after they are calclated. 

new=mean(mean(u2));
old=mean(mean(u1));

error=abs((new-old)/new)*100;

u=u2*lamda+(1-lamda)*u1;

count=count+1;

if count == 10000 
    break
end
%% The Results 
    
error=max(max(abs((u2-u1)./abs(u1))))*100;

count;
%count=(lamda-1)*1000;
% figure(2)
% surf(x,y,u,'EdgeColor','none')

end

