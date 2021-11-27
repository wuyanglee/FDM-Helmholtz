function [U, Meshes] = solve_helmholtz(Meshes, Paras)


% Paras.k = 4;  % wavenumber

domain = [0, 0, 1, 1];  % [ left-bottom point's (x,y) , right-top point's (x,y) ]
% Meshes.m = 20;
% Meshes.n = 20;
m = Meshes.m;
n = Meshes.n;

Meshes.dx = (domain(3)-domain(1))/m;
Meshes.dy = (domain(4) - domain(2))/n;

dx = Meshes.dx;
dy = Meshes.dy;


Meshes.x = linspace(domain(1), domain(3), m+1).';
Meshes.y = linspace(domain(2), domain(4), n+1).';
[ Meshes.X, Meshes.Y] = meshgrid(Meshes.x, Meshes.y) ;

A = assemble_helmholtz(Meshes, Paras.k);

exact_solution();

b = f_source(Meshes.X, Meshes.Y);
% mesh(b)

[A, b] = modify_boundaries(A, b, Meshes, Paras);

u = A\b(:);

U = reshape(u, n+1, m+1);

%% PLOT solution
% figure()
% mesh(Meshes.X, Meshes.Y, abs(U));
% shg