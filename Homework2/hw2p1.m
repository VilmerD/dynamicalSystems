%% Q1
F = @(x, a, b) [1 + x(2) - a*x(1)^2; b*x(1)];

%% Q2
b = 0.3;
na = 200;
a = linspace(0, 3, na);
nsteps = 300;

% Make plots
f1 = figure();
tiledlayout(3, 3);
f2 = figure();
ax2 = nexttile;
hold(ax2, 'ON');

% Loop over all a
for k = 1:na
    ak = a(k);
    if ak > 0
        xlim = 1/(2*ak)*((b - 1) + [1; -1]*sqrt((b - 1)^2 + 4*ak));
    else
        xlim = 1/(b - 1);
    end
    x0k = [1; b]*xlim(1) + 0.01*[1 1 1 0 0 0 -1 -1 -1; 1 0 -1 1 0 -1 1 0 -1];
    X = zeros(size(x0k, 2)*2, na);
    
    % Loop over initial values centered about the limit point
    for j = 1:size(x0k, 2)
        x0j = x0k(:, j);
        xij = x0j;
        
        % Take nsteps steps
        for i = 1:nsteps
            xij = F(xij, ak, b);
            X((2*j - 1):(2*j), i) = xij;
        end
    end
%     figure(f1);
%     ax = nexttile;
%     plot(ax, X(1:2:end, :)', X(2:2:end, :)', 'k');
%     title(ax, sprintf('a=%1.1f', ak));
    
    figure(f2);
    xlimk = unique(X(1, 200:nsteps));
    plot(ax2, ak, xlimk, '.k');
end