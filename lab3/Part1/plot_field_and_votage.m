clc
clear
close all

N = 100;
a = 0.5;
epsilon=8.854e-12;

z = linspace(-3,3,N);
Q = zeros(N);
Etot = zeros(N);
V = zeros(N);

for k = 1:N
    [Q0,Etot0,V0]=sphere_of_charge(0,0,z(k),a,N);
    Q(k) = Q0;
    Etot(k) = Etot0;
    V(k) = V0;
end

figure;
grid on;
hold all;
plot(z,Etot,'b-');
legend('Etot');
title('Electrical Field');
xlabel('z(m)')
ylabel('E(V/m)')


figure;
grid on;
hold all;
plot(z,V,'b-');
legend('V');
title('Electrical Potential');
xlabel('z(m)')
ylabel('V(V)')