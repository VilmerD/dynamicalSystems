%% Test eigs
x0 =        @(u1, u2) 1/2*((u1 - 1) + [1; -1].*sqrt((u1 - 1).^2 + 4*u2));
lambda =    @(u1, u2) 1/2*(u1 + diag([1 1 -1 -1])*sqrt(u1.^2 - kron([1; 1], 8*x0(u1, u2))));

%% Curves
u11 = linspace(-2, 0);
u12 = linspace(0, 2);
u1 = linspace(-2, 2);

su2 = @(mu) -1/4*(mu - 1).^2;
pu2 = @(mu) mu.^2 - 1/4*(mu - 1).^2;
hu2 = @(mu) 1/4*(-2*mu + 3);

%% Plots of curves
f = figure(1);
ax = axes(f, 'Position', [0.12, 0.15, 0.85, 0.78]);
hold(ax, 'On');
% Saddle
ps = plot(ax, u12, su2(u12), 'r');
plot(ax, u11, su2(u11), 'r--');

% Pitchfork
pp = plot(ax, u11, pu2(u11), 'g');
plot(ax, u12, pu2(u12), 'g--');

% Hopf
ph = plot(ax, u1, hu2(u1), 'b');

%Blörrg
xlabel(ax, '$\mu_1$', 'Interpreter', 'Latex');
ylabel(ax, '$\mu_2$', 'Interpreter', 'Latex');
xticks(ax, -2:2);
yticks(ax, -1:2);
axis(ax, [-2 2 -1 2]);
title('Curves in parameter space');
lgd = legend(ax, [ps, pp, ph], 'Saddle-Node', 'Pitchfork', 'Hopf');
set(lgd, 'NumColumns', 1, 'Location', 'Northeast');
set(f, 'Position', [100 100 400 300]);
%% Eigenvalues
ls = lambda(u1, su2);
lp = lambda(u1, pu2);
lh = lambda(u1, hu2);

%% Plots of fixed points
u11 = linspace(-2, 0);
u12 = linspace(0, 2);
u1 = linspace(-2, 2);

xs = @(mu) 1/2*(mu - 1);

xpp = @(mu) 1/2*(3*mu - 1);
xpn = @(mu) 1/2*(-mu - 1);

xhp = @(mu) 1/2*(2*mu - 3);
xhn = @(mu) 1/2*ones(size(mu));

f = figure(2);
ax = axes(f, 'Position', [0.12, 0.15, 0.85, 0.78]);
hold(ax, 'On');
% Saddle node
ps = plot(ax, u12, xs(u12), 'r');
plot(ax, u11, xs(u11), 'r--');

% Pitch fork
pp = plot(ax, u11, xpn(u11), 'g');
plot(ax, 0, xpp(0), 'go');
plot(ax, u12, xpn(u12), 'g--');

% Hopf
ph = plot(ax, u1, xhn(u11), 'b');
plot(ax, 2, xhp(2), 'bo');

%Blörrg
xlabel(ax, '$\mu_1$', 'Interpreter', 'Latex');
ylabel(ax, 'x/y');
xticks(ax, -2:2);
yticks(ax, -1:1);
title('Location of fixed point');
lgd = legend(ax, [ps, pp, ph], 'Saddle-Node', 'Pitchfork', 'Hopf');
set(lgd, 'NumColumns', 1, 'Location', 'Northwest');
set(f, 'Position', [100 100 400 300]);