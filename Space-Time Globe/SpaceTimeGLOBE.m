clear
close all
clc

X=0;Y=0;
yline(Y,LineWidth=2);
xline(X,LineWidth=2);

% Create the grids
[x,t] = meshgrid(0:5, 0:5);
grid on;

% Inputs
fprintf("\nVelocity wrt rest observer(Green Sheet) is Va(Red Sheet) and Vb(Blue Sheet)...\nFrom the frame of reference of Va coordinate is shifted...\nSpeed of light is taken as 1...\n\n");
V = input("[Va, Vb] = ");
v0 = V(1); vm = V(2);

% Conditions for relative velocity
if v0>1
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
tmovA = gamma*(t + v0*x);
xmovA = gamma*(x + v0*t);

tmovB = gamma*(t + vm*x);
xmovB = gamma*(x + vm*t);

tmovR = gamma*(t + vr*x);
xmovR = gamma*(x + vr*t);
t0 = t/gamma;
x0 = x*gamma;

% Label the globe
title('Space-Time Globe',FontSize=30,FontWeight='bold')
xlabel('X(Space)',FontSize=30);
ylabel('Y(Time)',FontSize=30);

% Plot the lines
hold on;
plot(-c*t,t,Color='#002050', LineWidth=2);
plot(c*t,t,Color='#002050', LineWidth=2);
plot(v0*t,t,'r',0*t0,t0,'r', LineStyle='--',LineWidth=3);
plot(vm*t,t,'b',vr*tnew,tnew,'b', LineStyle='--',LineWidth=2);

%Space-Time Grids
plot(xmovA,tmovA,Color='r');
plot(tmovA,xmovA,Color='r');
%plot(x0,t0,Color='r');
%plot(t0,x0,Color='r');
plot(xmovR,tmovR,Color='b');
plot(tmovR,xmovR,Color='b');
plot(xmovB,tmovB,Color='b');
plot(tmovB,xmovB,Color='b');
plot(x,t,Color='#107610');
plot(t,x,Color='#107610');

% Label the lines
text(c*3.5,3.5,"Light",FontSize=15,FontWeight="bold",Color='#002050');
text(-c*3.5,3.5,"Light",FontSize=15,FontWeight="bold",Color='#002050');
text(v0*4,4,"A",FontSize=15,FontWeight="bold",Color='r');
text(0,3,"A'",FontSize=15,FontWeight="bold",Color='r');
text(vm*3,3,"B",FontSize=15,FontWeight="bold",Color='b');
text(vr*7,7,"B'",FontSize=15,FontWeight="bold",Color='b');



