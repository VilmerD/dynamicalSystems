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

%% Centerfold dynamics
xhatdot= @(x,y) [-(10*x.*y^4-3*x.*y.^3+(20*x.^3-3*x.^2+10*x).*y.^2+(10-6*x.^3).*y+10*x.^5+6*x.^4+10*x.^3)/10;
-((10*x+10).*y.^5+(-3*x-3).*y.^4+(20*x.^3+17*x.^2+7*x+10).*y.^3+(-6*x.^3-6*x.^2).*y.^2+(10*x.^5+6*x.^4+6*x.^3+10*x.^2).*y-10*x)/10];

xmax = 1e0;
Nx = 51     ;
xx = linspace(-xmax, xmax, Nx);
yy = xx;
[X, Y] = meshgrid(xx, yy);
Z = xhatdot(X, Y);
px = Z(1:Nx,            :);
py = Z((Nx + 1):end,    :);
N = sqrt(px.^2 + py.^2);
quiver(X, Y, px./N, py./N);
axis image
xlabel('x');
ylabel('y');