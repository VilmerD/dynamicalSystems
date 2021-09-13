function X = fpi(f, x0, n)
% fpi iterates the function f starting at x0
if nargin < 3
    n = 500;
    tol = 1e-6;
else
    tol = 0;
end

xn = x0;
X = [x0];
for k = 1:n
    xnp1 = f(xn);
    X(k + 1) = xnp1;
    if min(abs(X(1:end-1) - xnp1)) < tol
        return
    end
    xn = xnp1;
end
end