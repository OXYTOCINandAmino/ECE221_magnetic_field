 function [Q,Etot,V]=sphere_of_charge(x,y,z,a,N)

epsilon=8.854e-12;

dtheta = pi / N;
dphi = 2 * pi / N;
phi = linspace(dphi,2*pi,N);
theta = linspace(0,pi,N+1);

xCoord = zeros(N,N+1);
yCoord = zeros(N,N+1);
zCoord = zeros(N,N+1);

r = cell(N,N+1);
dE = cell(N,N+1);
dQ = zeros(N,N+1);
dV = zeros(N,N+1);

E = [0 0 0];

for i = 1:length(phi)
    for j = 1:length(theta)
        xCoord(i,j) = a * sin(theta(j)) * cos(phi(i));
        yCoord(i,j) = a * sin(theta(j)) * sin(phi(i));
        zCoord(i,j) = a * cos(theta(j));
        
        r{i,j} = [x-xCoord(i,j) y-yCoord(i,j) z-zCoord(i,j)];
        
        dQ(i,j) = (a^2) * sin(theta(j)) * dtheta * dphi * cos(theta(j));
        
        dE{i,j} = 1/(4 * pi *epsilon) * dQ(i,j) / (dot(r{i,j},r{i,j})) .* r{i,j} /norm(r{i,j});
        dV(i,j) = norm(dE{i,j}) * norm(r{i,j});
        E = E + dE{i,j};
    end
end
Etot = norm(E);
V = sum(sum(dV));
Q = sum(sum(dQ));