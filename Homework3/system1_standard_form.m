function [A, f, B, g] = system1_standard_form()
A = [0 -1; 1 0];
B = -1;
f = @f;
g = @g;
end

function xhatnew = f(xhat, yhat)
x = xhat(1);
y = xhat(2);
z = yhat(1);
xhatnew = [x*z - x^4
           y*z + x*y*z];
end

function yhatnew = g(xhat, yhat)
x = xhat(1);
y = xhat(2);
z = yhat(1);
yhatnew = -(x^2 + y^2) + z^2 + sin(x^3);
end