function [Etot,Ex,Ey,Ez]=plotringofcharge_nonuni(a,N)
x=0; 
y=0;
z=linspace(-3,3,N); 

for e=1:length(z)
%[Etot(e),Ex(e),Ey(e),Ez(e)]=ringofcharge(a,rhol,0,0,z(e),N);
[Etot(e),Ex(e),Ey(e),Ez(e)]=ringofcharge_nonuni(a,0,0,z(e),N)
end


figure

hold on;
plot(z,Ey,'r');
plot(z,Ez,'r');
plot(z,Ex,'b');

xlabel('x - axis');
ylabel('Ez');
grid on;