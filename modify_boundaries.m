function [A, b] = modify_boundaries(A, b, Meshes, Paras)
% modify A and b to satisfy  boundary condition;
% top and bottom: homogeneous Dirichlet condition;
% left and right: Robin condition: \partial u / \partial n - i * k * u = 0;
% INPUT:
% A: Coefficient Matrix: discrete points  from left to right, then from top to bottom;
% b: right hand term function matrix: b(:) discrete points  from left to right, then from top to bottom;
% 
    m = Meshes.m;
    n = Meshes.n;
    dx = Meshes.dx;
    k = Paras.k;
    
    b(1, :) = 0;
    b(end, :) = 0;
    
    A(1:Meshes.m+1, :) = 0;
    A(1:Meshes.m+1, 1:Meshes.m+1) = speye(m+1);
    A(end-Meshes.m:end, :) = 0;
    A(end-Meshes.m:end, end-Meshes.m:end) = speye(m+1);
    
    b(2:end-1, 1) = 0;
    b(2:end-1, end) = 0;
    
    A(1:m+1:end, :) = 0;
    A(1:m+1:end, 1:m+1:end) = (1-1i*k*dx) * speye(n+1);
    A(1:m+1:end, (1:m+1:end)+1) = -1 * speye(n+1);
    
    A(m+1:m+1:end, :) = 0;
    A(m+1:m+1:end, m+1:m+1:end) = (1-1i*k*dx) * speye(n+1);
    A(m+1:m+1:end, (m+1:m+1:end)-1) = -1 * speye(n+1);

end