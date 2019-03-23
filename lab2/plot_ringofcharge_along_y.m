function [Etot,Ex,Ey,Ez]=plot_ringofcharge_along_y(a,rhol,N)
x=0; 
y=linspace(0.1,2,N);
z=0; 

for e=1:length(y)
[Etot(e),Ex(e),Ey(e),Ez(e)]=ringofcharge(a,rhol,0,y(e),0,N);
end

figure
hold all;

subplot(3,1,1);
plot(y,Ex,'-r');
xlabel('y - axis');
ylabel('Ex');

subplot(3,1,2);
plot(y,Ey,'-b');
xlabel('y - axis');
ylabel('Ey');

subplot(3,1,3);
plot(y,Ez,'-g');
xlabel('y - axis');
ylabel('Ez');
grid on;