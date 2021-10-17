function up = hwODE(~, u, a, b)
x = u(1);
y = u(2);
r = norm(u, 2);
dx = a * x - b * y - x * r^2;
dy = b * x + a * y - y * r^2;
up = [dx; dy];
end