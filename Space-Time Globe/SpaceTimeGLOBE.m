clear
close all
clc

X=0;Y=0;
yline(Y,LineWidth=1);
xline(X,LineWidth=1);

% Create the grids
G = input("No. of grid for Space-Time Sheet(Recommended 1 to 5) = ");
g=G(1);
[x,t] = meshgrid(0:g, 0:g);
grid on;

% Label the globe
title('Space-Time Globe',FontSize=30,FontWeight='bold')
xlabel('X(Space)',FontSize=30);
ylabel('Y(Time)',FontSize=30);

% Inputs
fprintf("\n\nVelocity wrt rest observer(Green Sheet) is Va(Red Sheet) and Vb(Blue Sheet)...\nFrom the frame of reference of Va coordinate is shifted...\nSpeed of light is taken as 1...\n\n");
V = input("[Va, Vb] = ");
v0 = V(1);%v0=Va
vm = V(2);%vm=Vb

% Conditions for not crossing light barrier
if v0>1 || v0<-1 || vm>1 || vm<-1
    fprintf("\nCannot exceed light barrier...\n\n");
    return
end

% Relative velocity and Lorentz transformation
vr = (vm-v0)/(1-v0*vm);
c = 1;
gamma = 1/sqrt(1-vr^2);

% Moving frame coordinate wrt rest observer
tmovA = (t + v0*x)/sqrt(1-v0^2);
xmovA = (x + v0*t)/sqrt(1-v0^2);

tmovB = (t + vm*x)/sqrt(1-vm^2);
xmovB = (x + vm*t)/sqrt(1-vm^2);

% Relative frame coordinate wrt other observer
tmovBR = gamma*(t + vr*x);
xmovBR = gamma*(x + vr*t);

tmovAR = gamma*(t - vr*x);
xmovAR = gamma*(x - vr*t);

% Plot the lines
hold on;
plot(-c*t,t,Color='#ecc864', LineWidth=4);%Light
plot(c*t,t,Color='#ecc864', LineWidth=4);%Light
plot(v0*t,t,'r',LineWidth=4);%Line A
plot(vm*t,t,'b',LineWidth=4);%Line B
plot(vr*tmovAR,tmovAR,Color='#54b5fb',LineWidth=4);%Line B'
plot(-vr*tmovBR,tmovBR,Color='#9b0065',LineWidth=4);%Line A'
plot(x*0,t,Color='#107610',LineWidth=4);%Rest perpective line

% Label the lines
text(c*g,g,"Light",FontSize=15,FontWeight="bold",Color='#ccaa44');%Light
text(-c*g,g,"Light",FontSize=15,FontWeight="bold",Color='#ccaa44');%Light
text(v0*(g-0.7),(g-0.7),"A",FontSize=15,FontWeight="bold",Color='r');%A
text(-vr*(g+0.3),(g+0.3),"A'",FontSize=15,FontWeight="bold",Color='#b73a3a');%A'
text(vm*g,g,"B",FontSize=15,FontWeight="bold",Color='b');%B
text(vr*g,g,"B'",FontSize=15,FontWeight="bold",Color='#54b5fb');%B'
text(0*(g-0.5),(g-0.5),"RP",FontSize=15,FontWeight="bold",Color='#107610');%Rest Perspective

% Space-Time Grids
plot(xmovA,tmovA,Color='r',LineWidth=1);%Space-Time Sheet of A wrt Rest observer
plot(tmovA,xmovA,Color='r',LineWidth=1);%Space-Time Sheet of A wrt Rest observer

plot(xmovBR,tmovBR,Color='#54b5fb',LineWidth=1,LineStyle='--');%Space-Time Sheet of B wrt A
plot(tmovBR,xmovBR,Color='#54b5fb',LineWidth=1,LineStyle='--');%Space-Time Sheet of B wrt A

plot(xmovAR,tmovAR,Color='#9b0065',LineWidth=1,LineStyle='--');%Space-Time Sheet of A wrt B
plot(tmovAR,xmovAR,Color='#9b0065',LineWidth=1,LineStyle='--');%Space-Time Sheet of A wrt B

plot(xmovB,tmovB,Color='b',LineWidth=1);%Space-Time Sheet of B wrt Rest observer
plot(tmovB,xmovB,Color='b',LineWidth=1);%Space-Time Sheet of B wrt Rest observer

plot(x,t,Color='#107610',LineWidth=1);%Space-Time Sheet of A or B wrt them
plot(t,x,Color='#107610',LineWidth=1);%Space-Time Sheet of A or B wrt them

