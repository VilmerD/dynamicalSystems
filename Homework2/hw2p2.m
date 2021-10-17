%% Q5
a = -1;
bs = [-1 0 1];
m = {'r--', 'k', 'g--'};
f1 = figure();
ax = nexttile;
hold(ax, 'ON');
[xx, yy] = meshgrid([1 0 -1], [1 0 -1]);
x0 = [xx(:), yy(:)]';
subs = [];
for k = 1:numel(bs)
    for l = 1:size(x0, 2)
        x0l = x0(:, l);
        [t, y] = ode45(@(t, y) hwODE(t, y, a, bs(k)), [0, 10], x0l);
        xx = y(:, 1);
        yy = y(:, 2);
        L = plot(ax, xx, yy, m{k});
        plotdir(ax, xx, yy, 'k', 1e-1, [8]);
    end
    subs(k) = L;
end
xticks([-abs(a), abs(a)]);
xticklabels({'-a', 'a'})
yticks([-abs(a), abs(a)]);
yticklabels({'-a', 'a'})

title(sprintf('a = %i', a))
lgd = legend(subs, {'b < 0', 'b = 0', 'b > 0'}, 'Fontsize', 8, ...
    'Location', 'best');
axis(ax, 'equal');

set(f1, 'Position', [100 100 300 300]);
saveas(f1, 'Homework2\Figures\orbitnega', 'png');