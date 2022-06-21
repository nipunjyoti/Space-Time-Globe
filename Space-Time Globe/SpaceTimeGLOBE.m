clear
close all
clc

X=0;Y=0;
yline(Y,LineWidth=0.8,LineStyle="--");
xline(X,LineWidth=0.8,LineStyle='--');

% Create the grids
G = input("No. of grid for Space-Time Sheet(Recommended 5 or less) = ");
g=G(1);
[x,t] = meshgrid(0:g, 0:g);
grid on;

% Inputs
fprintf("\n\nVelocity wrt rest observer(Green Sheet) is Va(Red Sheet) and Vb(Blue Sheet)...\nFrom the frame of reference of Va coordinate is shifted...\nSpeed of light is taken as 1...\n\n");
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

tmovBR = gamma*(t + vr*x);
xmovBR = gamma*(x + vr*t);

t0 = t*sqrt(1-v0^2);
x0 = x/sqrt(1-v0^2);

% Label the globe
title('Space-Time Globe',FontSize=30,FontWeight='bold')
xlabel('X(Space)',FontSize=30);
ylabel('Y(Time)',FontSize=30);

% Plot the lines
hold on;
plot(-c*t,t,Color='#ecc864', LineWidth=4);%Light
plot(c*t,t,Color='#ecc864', LineWidth=4);%Light
plot(v0*t,t,'r',LineWidth=4);%Line A
plot(vm*t,t,'b',LineWidth=4);%Line B
plot(vr*tnew,tnew,Color='#54b5fb',LineWidth=4);%Line B'
plot(-vr*tmovBR,tmovBR,Color='#9b0065',LineWidth=4);%Line A'
plot(x*0,t,Color='#107610',LineWidth=4);%Rest perpective line

%Space-Time Grids
plot(xmovA,tmovA,Color='r',LineWidth=1,LineStyle='--');
plot(tmovA,xmovA,Color='r',LineWidth=1,LineStyle='--');

plot(xmovBR,tmovBR,Color='#54b5fb',LineWidth=1,LineStyle='--');
plot(tmovBR,xmovBR,Color='#54b5fb',LineWidth=1,LineStyle='--');

plot(xnew,tnew,Color='#9b0065',LineWidth=1,LineStyle='--');
plot(tnew,xnew,Color='#9b0065',LineWidth=1,LineStyle='--');

plot(xmovB,tmovB,Color='b',LineWidth=1,LineStyle='--');
plot(tmovB,xmovB,Color='b',LineWidth=1,LineStyle='--');

plot(x,t,Color='#107610',LineWidth=1,LineStyle='--');
plot(t,x,Color='#107610',LineWidth=1,LineStyle='--');

% Label the lines
text(c*(g-1),(g-1),"Light",FontSize=15,FontWeight="bold",Color='#ccaa44');%Light
text(-c*(g-1),(g-1),"Light",FontSize=15,FontWeight="bold",Color='#ccaa44');%Light
text(v0*g,g,"A",FontSize=15,FontWeight="bold",Color='r');%A
text(-vr*(g-0.5),(g-0.5),"A'",FontSize=15,FontWeight="bold",Color='#b73a3a');%A'
text(vm*(g-1),(g-1),"B",FontSize=15,FontWeight="bold",Color='b');%B
text(vr*(g-1),(g-1),"B'",FontSize=15,FontWeight="bold",Color='#3049ad');%B'
text(0*(g-1.5),(g-1.5),"RP",FontSize=15,FontWeight="bold",Color='#107610');%Rest Perspective

