clear
close all
clc

X=0;Y=0;
yline(Y,LineWidth=0.8,LineStyle="--");
xline(X,LineWidth=0.8,LineStyle='--');

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
plot(-c*t,t,Color='#ecc864', LineWidth=4);
plot(c*t,t,Color='#ecc864', LineWidth=4);
plot(v0*t,t,'r',LineWidth=4);
plot(0*t0,t0, Color='#b73a3a', LineWidth=4);
plot(vm*t,t,'b',LineWidth=3);
plot(vr*tnew,tnew,Color='#54b5fb',LineWidth=4);

%Space-Time Grids
plot(xmovA,tmovA,Color='r',LineWidth=1,LineStyle='--');
plot(tmovA,xmovA,Color='r',LineWidth=1,LineStyle='--');
%plot(x0,t0,Color='r');
%plot(t0,x0,Color='r');
plot(xmovR,tmovR,Color='#54b5fb',LineWidth=1,LineStyle='--');
plot(tmovR,xmovR,Color='#54b5fb',LineWidth=1,LineStyle='--');
plot(xmovB,tmovB,Color='b',LineWidth=1,LineStyle='--');
plot(tmovB,xmovB,Color='b',LineWidth=1,LineStyle='--');
plot(x,t,Color='#107610',LineWidth=1,LineStyle='--');
plot(t,x,Color='#107610',LineWidth=1,LineStyle='--');

% Label the lines
text(c*0.7,0.7,"Light",FontSize=15,FontWeight="bold",Color='#ccaa44');
text(-c*0.7,0.7,"Light",FontSize=15,FontWeight="bold",Color='#ccaa44');
text(v0*1,1,"A",FontSize=15,FontWeight="bold",Color='r');
text(0,0.6,"A'",FontSize=15,FontWeight="bold",Color='#b73a3a');
text(vm*0.9,0.9,"B",FontSize=15,FontWeight="bold",Color='b');
text(vr*0.3,0.3,"B'",FontSize=15,FontWeight="bold",Color='#3049ad');


