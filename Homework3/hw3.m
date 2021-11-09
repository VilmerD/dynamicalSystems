%% Standard form
[A, f, B, g] = system1_standard_form();

%% Center manifold (approximation)
h = @system1_center_manifold;

%%
xmax = 1e-1;
Nx = 10;
xx = linspace(-xmax, xmax, Nx);
yy = xx;
[X, Y] = meshgrid(xx, yy);

Z = h(X, Y);
[px, py] = gradient(Z,.2,.15);
quiver(X, Y, px, py);
axis image

%% Hyperbolic dynamics
