clc
clear
close all

N = 200;
a = 0.5;
epsilon=8.854e-12;

z = linspace(-3,3,N);
Q = zeros(N);
Ex = zeros(N);
Ey = zeros(N);
Ez = zeros(N);
Etot = zeros(N);
V = zeros(N);

for k = 1:N
    [Q0,Ex0,Ey0,Ez0,Etot0,V0]=sphere_of_charge_non_uni(0,0,z(k),a,N)
    Q(k) = Q0;
    Ex(k) = Ex0;
    Ey(k) = Ey0;
    Ez(k) = Ez0;
    Etot(k) = Etot0;
    V(k) = V0;
    
end

figure;
grid on;
hold all;
plot(z,Ex,'b--');
plot(z,Ey,'g--');
plot(z,Ez,'y--');
plot(z,Etot,'r-');
legend('Ex','Ey','Ez','Etot');
title('Electrical Field');
xlabel('z(m)')
ylabel('E(V/m)')


figure;
grid on;
hold all;
plot(z,V,'b-');
title('Electrical Potential');
xlabel('z(m)')
ylabel('V(V)')