%% Part 1
F = @(x, a, b) [1 + x(2) - a*x(1)^2; b*x(1)];

b = 0.3;
na = 400;
amin = 0;
amax = 1.5;
xx = linspace(0, 1, na);
expa = xx.^(1/2)*(exp(amax) - exp(amin)) + exp(amin);
a = log(expa);
nsteps = 200;

% Make plots
% f1 = figure();
% tiledlayout(3, 3);
f2 = figure();
ax2 = nexttile;
hold(ax2, 'ON');

% Loop over all a
for k = 1:na
    ak = a(k);
    if ak > 0
        xlim = 1/(2*ak)*((b - 1) + [1; -1]*sqrt((b - 1)^2 + 4*ak));
    else
        xlim = [1; 1]*1/(b - 1);
    end
    x0k = [1; b]*xlim(1) + 0.01;
    X = zeros(size(x0k, 2)*2, na);
    
    % Loop over initial values centered about the limit point
    for j = 1:size(x0k, 2)
        x0j = x0k(:, j);
        xij = x0j;
        
        % Take nsteps steps
        for i = 1:nsteps
            xij = F(xij, ak, b);
            X((2*j - 1):(2*j), i) = xij;
            if abs(xij) > 1e3
                i = nsteps;
            end
        end
    end
    if max(abs(X(1, :))) < 1e3
        figure(f2);
        xlimk = unique(X(1, 100:nsteps));
        plot(ax2, ak, xlimk, '.k');
    end
end
xlabel('a');
ylabel('xlim');
title('Bifurcation diagram for b=0.3');
axis tight;

%%
f = figure;
ax = axes();
bb = linspace(-1, 1, 100);
aap = 3*(bb - 1).^2/4;
aan = -(bb - 1).^2/4;
plot(ax, aap, bb, 'b');
hold(ax, 'ON');
plot(ax, 1/2, 0, 'r.');
plot(ax, aan, bb, 'b');
xlabel(ax, 'a');
xticks([-1 0 1/2 3]);
ylabel(ax, 'b');
yticks([-1 0 1])
title('Stability of the fixed point');