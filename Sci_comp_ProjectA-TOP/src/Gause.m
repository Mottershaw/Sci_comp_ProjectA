function [ u,count_g,error ] = Gause( max_error,nodes,lamda_start)
%This will slove the APc2-2 for using Gause approximatio 
%   Gause will return the solution
% error is the ammount of error that you specify 
% nodes how fine you want the mesh for the square we are looking at

ax=pi;
bx=-pi;
% Y Boundarys 
ay=pi;
by=-pi;
%% The boundry 
n=nodes;
m=n;
%Domain 
Do=ones(n,m)*0.00001;

dx=(2*pi/(m-1));
x=pi:-(dx):-pi;
y=pi:-(dx):-pi;
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
    Do(:,1)=1;
    v_left=0;

u=Do;

%surf(x,y,u,'EdgeColor','none')
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

lamda=lamda_start;
count_g=0;
error=100; % Becasue we have not solved it yet the Error is a baseline of 100%

% It will solve untill the error Max error is below the specified value. 

while error > max_error
 
    
u1=u; % the value before they run though the system 

u1(:,1)=u(:,1).*dx;


    for i=2:1:n-1
        for j=2:1:m-1
          u(i,j)=0.25*(u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j+1)+F(i,j));
        end
    end
u2=u;   % the values after they are calclated. 

error=max(max(abs((u1-u2)./u2)))*100;

u=u2*lamda+(1-lamda)*u1;

count_g=count_g+1;

if count_g== 3000
    break
end
end
%% The Results 
    
error=max(max(abs((u1-u2)./u2)))*100;
count_g;
%count=(lamda-1)*1000;
% figure(2)
% surf(x,y,u,'EdgeColor','none')

end
