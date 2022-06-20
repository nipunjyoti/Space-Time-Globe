clear
close all
clc

X=0;Y=0;
yline(Y,LineWidth=2);
xline(X,LineWidth=2);

% Create the grids
[x,t] = meshgrid(0:1, 0:1);
grid on;

% Inputs
fprintf("\nVelocity wrt rest observer(Green Sheet) is Va(Red Sheet) and Vb(Blue Sheet)...\nFrom the frame of reference of Va coordinate is shifted...\nSpeed of light is taken as 1...\n\n");
V = input("[Va, Vb] = ");
v0 = V(1); vm = V(2);

% Conditions for relative velocity
if v0>1 || vm>1
    fprintf("\nCannot exceed light barrier...\n\n");
    return
end

% Relative velocity and Lorentz transformation
vr = (vm-v0)/(1-v0*vm);
c = 1;
gamma = 1/sqrt(1-vr^2);
% Change of coordinate
tnew = gamma*(t - vr*x);
xnew = gamma*(x - vr*t);
% Moving frame coordinate wrt rest observer
tmovA = (t + v0*x)/sqrt(1-v0^2);
xmovA = (x + v0*t)/sqrt(1-v0^2);

tmovB = (t + vm*x)/sqrt(1-vm^2);
xmovB = (x + vm*t)/sqrt(1-vm^2);

tmovR = gamma*(t + vr*x);
xmovR = gamma*(x + vr*t);
t0 = t*sqrt(1-v0^2);
x0 = x/sqrt(1-v0^2);

% Label the globe
title('Space-Time Globe',FontSize=30,FontWeight='bold')
xlabel('X(Space)',FontSize=30);
ylabel('Y(Time)',FontSize=30);

% Plot the lines
hold on;
plot(-c*t,t,Color='#002050', LineWidth=3);
plot(c*t,t,Color='#002050', LineWidth=3);
plot(v0*t,t,'r',LineWidth=3);
plot(0*t0,t0, Color='#e87200', LineWidth=3);
plot(x0,0*t0, Color='#e87200', LineWidth=3);
plot(vm*t,t,'b',LineWidth=3);
plot(vr*tnew,tnew,Color='#54b5fb',LineWidth=3);

%Space-Time Grids
plot(xmovA,tmovA,Color='r');
plot(tmovA,xmovA,Color='r');
%plot(x0,t0,Color='r');
%plot(t0,x0,Color='r');
plot(xmovR,tmovR,Color='#54b5fb');
plot(tmovR,xmovR,Color='#54b5fb');
plot(xmovB,tmovB,Color='b');
plot(tmovB,xmovB,Color='b');
plot(x,t,Color='#107610');
plot(t,x,Color='#107610');

% Label the lines
text(c*0.7,0.7,"Light",FontSize=15,FontWeight="bold",Color='#002050');
text(-c*0.7,0.7,"Light",FontSize=15,FontWeight="bold",Color='#002050');
text(v0*1,1,"A",FontSize=15,FontWeight="bold",Color='r');
text(0,0.6,"A'",FontSize=15,FontWeight="bold",Color='#e87200');
text(vm*0.7,0.7,"B",FontSize=15,FontWeight="bold",Color='b');
text(vr*1.3,1.3,"B'",FontSize=15,FontWeight="bold",Color='#3049ad');


