function [Etot,Ex,Ey,Ez]=ringofcharge(a,rhol,x,y,z,N)
epsilon=8.854e-12;
A = rhol*a/(4*pi*epsilon);

d_theta=2*pi/N;% Discretize the total angle into N pieces

theta=linspace(0,2*pi-0.00001,N); 
dEx = (d_theta*A).* (x-a.*cos(theta))./((x-a.*cos(theta)).^2+(y-a.*sin(theta)).^2+ z^2).^(3/2); 
dEy = (d_theta*A).* (y-a.*sin(theta))./((x-a.*cos(theta)).^2+(y-a.*sin(theta)).^2+ z^2).^(3/2);
dEz = (d_theta*A).* (z)./((x-a.*cos(theta)).^2+(y-a.*sin(theta)).^2+ z^2).^(3/2); 

Ex= sum(dEx);
Ey= sum(dEy);
Ez= sum(dEz);
Etot=(Ex^2+Ey^2+Ez^2)^0.5;