%% Q1
xlim = fpi(@cos, 0);
xlim(end)

%% Q2
% Converges very slowly as atan(x) approx x for small x
xlim = fpi(@atan, 4);
xlim(end)

%% Q3
a = 3;
f = @(x) 0.5*(x + a/x);
xlim = fpi(f, 1);
xlim(end)


%% Q4
f = @(x, mu) mu*x*(1 - x);
xlim(end)

%% Q5