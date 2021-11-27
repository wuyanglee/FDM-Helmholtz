
%%  From WangZiming 
% uexact = @(x, y) besselj(1, k*sqrt(x.^2+y.^2)) .* exp(1i*atan(y./x)); % NOTE: x=0 is possible.

%% From Singer
% u_exact = @(x, y) sin(x).*sin(2*y);
% f_function = @(x, y) (k^2-5)*sin(x).*sin(2*y);

%% From Wang2008
% u_exact = @(x, y) (1+1i)*sin(0.5*k*x).*sin(0.5*(k-pi)*(y+1));
% f_source = @(x, y) (-0.25*k^2*(1+1i) - 0.25*(k-pi)^2*(1+1i) +k^2 )*sin(0.5*k*x).*sin(0.5*(k-pi)*(y+1));

% g_bottom = @(x, y) -0.5*(k-pi)*(1+1i)*sin(0.5*k*x).*cos(0.5*(k-pi)*(y+1));
% g_right = @(x, y) 0.5*k*(1+1i)*cos(0.5*k*x).*sin(0.5*(k-pi)*(y+1));
% g_top = @(x,y) 0.5*(k-pi)*(1+1i)*sin(0.5*k*x).*cos(0.5*(k-pi)*(y+1));
% g_left = @(x, y) -0.5*k*(1+1i)*cos(0.5*k*x).*sin(0.5*(k-pi)*(y+1));

%% From chen2015
f_source = @(x, y) exp(-dx^(-2) *((x-0.5).^2 +(y-0.5).^2) );
g_bottom = @(x, y) 0.*x.*y;
g_top = @(x, y) 0.*x.*y;
u_exact = @(x, y) 0.*x.*y;
