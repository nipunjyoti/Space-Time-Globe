clear
close all
clc

% Create the grids
[x,t] = meshgrid(-80:80, -80:80);
grid on;

% Inputs
fprintf("\nVelocity wrt rest observer is Va and Vb...\nFrom the frame of reference of Va coordinate is shifted...\n\n");
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
tmov = gamma*(t + v0*x);
xmov = gamma*(x + v0*t);
tmov1 = gamma*(t + vr*x);
xmov1 = gamma*(x + vr*t);
t0 = t/gamma;

% Label the globe
title('Space-Time Globe',FontSize=30,FontWeight='bold')
xlabel('X(Space)',FontSize=30);
ylabel('Y(Time)',FontSize=30);

% Plot the lines
hold on;
plot(0*t,t,'g',-v0*tnew,tnew,'g', LineWidth=2);
plot(-c*t,t,Color='#ffcc00', LineWidth=2);
plot(c*t,t,Color='#ffcc00', LineWidth=2);
plot(v0*t,t,'r',0*t0,t0,'r', LineStyle='--',LineWidth=3);
plot(vm*t,t,'b',vr*tnew,tnew,'b', LineStyle='--',LineWidth=2);
plot(xmov,tmov,Color='#ffcc33');
plot(xmov1,tmov1,Color='#cc99ff');

% Label the lines
text(c*60,-60,"Light",FontSize=15,FontWeight="bold");
text(-c*60,-60,"Light",FontSize=15,FontWeight="bold");
text(v0*50,50,"A",FontSize=15,FontWeight="bold");
text(0,60,"A'",FontSize=15,FontWeight="bold");
text(vm*40,40,"B",FontSize=15,FontWeight="bold");
text(vr*75,75,"B'",FontSize=15,FontWeight="bold");
text(-v0*100,100,"Rest'",FontSize=15,FontWeight="bold");
text(0,78,"Rest",FontSize=15,FontWeight="bold");

