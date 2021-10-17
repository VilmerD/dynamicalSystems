b = linspace(0, 1);

% Hénon stability curve
axn = @(a, b) 0.5*((b - 1) + sqrt((b - 1).^2 + 4*a));
l = @(a, b) abs(axn(a, b)) + sqrt(axn(a, b).^2 + b) - 1;

% daxnda = @(a, b) ((b - 1)^2 + 4*a)^(-0.5);
% dldaxn = @(a, b) 1 + axn(a, b) / sqrt((axn(a, b))^2 + b);
% dl = @(a, b) daxnda(a, b)*dldaxn(a, b);

a = zeros(size(b));
for k = 1:numel(b)
    fk = @(a) l(a, b(k));
    a(k) = newton(fk, 1/2);
end

figure();
ax = nexttile;
axis(ax, [-0.5 1 -0.5 1]);
hold(ax, 'ON');
plot(ax, abs(a), b, 'r');
plot(ax, [-10 10], [0 0], 'k');
plot(ax, [0 0], [-10 10], 'k');
xlabel('a');
ylabel('b');

% Test 1 value
at = 0.5;
bt = 0.5;
T = -2*axn(at, bt);
D = -bt;
lammax = abs(T)/2 + sqrt(T^2/4 - D);
plot(ax, at, bt, 'ro');
text(ax, at, bt, sprintf('lmax = %1.3f', lammax));

%%
aa = linspace(0, 3, 120);
bb = linspace(0, 1, 40);
[A, B] = meshgrid(aa, bb);

AXn = ((B - 1) + sqrt((B - 1).^2 + 4*A))./2;

T = -2*AXn;
D = -B;
Tok = (T.^2 - 4*B) < 0;
lmax = abs(T)/2 + sqrt((T.^2)/4 - D);
Aok = A(lmax < 1);
f = figure();
ax = nexttile;
surf(ax, A, B, lmax, 'Linestyle', 'none');
hold(ax, 'ON');
%%
xn = @(a, b) 1/(2*a)*((b - 1) + [1; -1]*sqrt((b - 1)^2 + 4*a));
eigs = @(a, b) -a*xn(a, b) + sqrt((a*xn(a, b)).^2 + b)*[1 -1];
eigsmax = zeros(size(a));
for k = 1:numel(a)
    eigsk = eigs(a(k), b(k));
    eigsmax(k) = max(abs(eigsk(:)));
end
eigsmax
