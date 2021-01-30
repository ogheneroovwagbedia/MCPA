clear all;
close all;

nTime = 1000; %number of steps
dt = 1;
force = 1;
Velocity = 0;
m = 1;
avev = 0;
n=0;
x = 0;
Ps = 0.05;
% Ps = 1-exp(-dt/20)
driftV = 0;
t=0;

%calculated acceleration due to force
for i = 2:nTime
    prob = rand(1);
    if(prob<=Ps)
        Velocity(i) = 0;%starting v
    else 
        Velocity(i) = Velocity(i-1) + ((force/m)*dt);%calculating v
    end
        
    driftV(i) = mean(Velocity);  %drift calculation
    x(i) = x(i-1) + Velocity(i-1)*dt + (force/(2*m))*dt^2; %position array
    t(i)= t(i-1) + dt; %time array

    subplot(3,1,1)
    hold on
    plot(t,Velocity,'r')
    plot(t,driftV,'go')
     title(sprintf('V vs time. Average =%0.5f ',driftV(i)));

    subplot(3,1,2)
    hold on
    plot(x,Velocity,'r')
    plot(x,driftV,'go')
    

    subplot(3,1,3)
    hold on
    plot(t,x)
    
    pause(0.001)
    
end