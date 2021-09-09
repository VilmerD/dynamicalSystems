function X = fpi(f, x0, n)
% fpi iterates the function f starting at x0
tol = 1e-6;
if nargin < 3
    n = 500;
end

xn = x0;
X = [x0];
for k = 1:n
    xnp1 = f(xn);
    X(k + 1) = xnp1;
    if abs(xnp1 - xn) < tol
        return
    end
    xn = xnp1;
end
end