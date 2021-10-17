function xn = newton(f, x0)
tol = 1e-3;
h = sqrt(eps);

fp = @(fn, x) (f(x + h) - fn)/h;

xn = x0;
fn = f(xn);
while norm(fn) > tol
    fpn = fp(fn, xn);
    xn = xn - fn/fpn;
    fn = f(xn);
end