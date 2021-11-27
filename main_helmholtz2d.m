

clear all;
close all;

mS = [20, 40, 60, 80, 120];
nS = mS;
Paras.k = 4;  % wavenumber

n_case = length(mS);

for ii = 1:length(mS)
    
    Meshes.m = mS(ii);
    Meshes.n = nS(ii);
    
    [ U{ii}, Mesh{ii} ] = solve_helmholtz(Meshes, Paras);
end

%% 
for ii = 1:n_case-1
Uinter{ii} = interp2(Mesh{n_case}.X,  Mesh{n_case}.Y,  U{n_case}, Mesh{ii}.X, Mesh{ii}.Y, 'spline' );
err{ii} = norm( Uinter{ii} - U{ii} );
end

%% PLOT
figure()
loglog(1./mS(1:n_case-1), [ err{[1:n_case-1]} ], '-+', 1./mS(1:n_case-1), 1./mS(1:n_case-1).^2, '-');

