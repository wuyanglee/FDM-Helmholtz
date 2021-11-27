function A = assemble_helmholtz(meshes, k)
% The order of discrete points is horizontal first;
% Scheme: Five-points finite difference;
% 
% Input:
% nx: the number of sub-interval along X-axis
% ny: the number of sub-interval along Y-axis
% dx: the meshsize along X-axis
% dy: the meshsize along Y-axis
% k :  the wave number
% 
% output:
% discretization of Helmholtz equation

m = meshes.m;
n = meshes.n;
dx = meshes.dx;
dy = meshes.dy;

ex = ones(m+1, 1);
ey = ones(n+1, 1);

Ax_direction =(1./(dx*dx)) * spdiags( [-ex, 2*ex, -ex], -1:1, m+1, m+1);
Ay_direction =(1./(dy*dy)) * spdiags( [-ey, 2*ey, ey], -1:1, n+1, n+1);

Axy = kron( speye(n+1, n+1), Ax_direction) + kron(Ay_direction, speye(m+1, m+1));
A = Axy - k^2 * speye( (m+1)*(n+1), (m+1)*(n+1) );


end
