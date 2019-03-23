function [Etot,Ex,Ey,Ez]=plotringofcharge(a,rhol,N)
x=0; 
y=0;
z=linspace(-3,3,N); 

for e=1:length(z)
[Etot(e),Ex(e),Ey(e),Ez(e)]=ringofcharge(a,rhol,0,0,z(e),N);
end

% calculate Ez theory
epsilon=8.854e-12;
Ez_theory = ((rhol*a)/(2*epsilon)).*z./(a^2+z.^2).^(3/2);

figure
plot(z,Ez,'ro');
hold on;
plot(z,Ez_theory,'-b');
legend('calculated value','theoretical value');
xlabel('x - axis');
ylabel('Ez');
grid on;
