%% Q1
xlim = fpi(@cos, 0);
xlim(end)

%% Q2
% Converges very slowly as atan(x) approx x for small x ie L apprx 1
xlim = fpi(@atan, 4);
xlim(end)

%% Q3
a = 3;
f = @(x) 0.5*(x + a/x);
xlim = fpi(f, 1);
xlim(end)


%% Q4
fmu = @(x, mu) mu*x*(1 - x);

n = 1000;
nmin = 200;
mumin = 2;
mumax = 4;
mus = linspace(mumin, mumax, 10000);

% Iterate for different mus
f = figure();
ax = nexttile;
axis(ax, [mumin, mumax, 0, 1]);
xlabel(ax, '$\mu$', 'Interpreter', 'Latex');
ylabel(ax, '$x_{lim}$', 'Interpreter', 'Latex');
title(ax, '$x_n = \mu x_n(1-x_n)$', 'Interpreter', 'Latex');
hold(ax, 'ON');
for k = 1:numel(mus)
    muk = mus(k);
    X = fpi(@(x) fmu(x, muk), 0.5, n);
    
    % Find unique elements
    yn = unique(X(nmin:end));
    
    % Add to plot
    plot(ax, muk*ones(1, numel(yn)), yn, 'k.');
    drawnow();
end
%% Q5
L = [-1 0 1];
xx = -4:1:4;
yy = -4:1:4;
[X, Y] = meshgrid(xx, yy);
Y0 = [reshape(X, 1, []); reshape(Y, 1, [])];
tmax = 5;
nt = 1000;
tt = reshape(linspace(0, tmax, nt), [], 1);

% Plot
for i = 1:3
    f = figure();
    ax1 = nexttile;
    ax2 = nexttile;
    axis(ax1, [-4 4 -4 4]);
    axis(ax2, [0 tmax -4 4]);
    hold(ax1, 'ON');
    hold(ax2, 'ON');
    
    for k = 1:size(Y0, 2)
        l = L(i);
        ex = exp(tt*l);
        A = (kron(ex, eye(2, 2)) + kron(ex.*tt, [0 1; 0 0]));
        Y = A*Y0(:, k);
        Y = reshape(Y', 2, []);
        Xt = Y(1, :);
        Yt = Y(2, :);
        plotdir(ax1, Xt, Yt, 'k');
        if (~mod(k, 10))
            plot(ax2, tt, Xt, 'r');
            plot(ax2, tt, Yt, 'g');
        end
    end
    s = {'$\lambda < 0$', '$\lambda = 0$', '$\lambda > 0$'};
    sgtitle(s{i}, 'Interpreter', 'Latex');
    legend(ax2, 'x', 'y');
    title(ax1, 'xy phase');
    title(ax2, 't plot');
    xlabel(ax1, 'x');
    ylabel(ax1, 'y');
    xlabel(ax2, 't');
    ylabel(ax2, 'y/x');
end