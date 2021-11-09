function up = system1(u)
x = u(1);
y = u(2);
z = u(3);
up = [-y + x*z - x^4
      x + y*z + x*y*z
      -z-(x^2 + y^2) + z^2 + sin(x^3)];
end