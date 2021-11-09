function h = system1_center_manifold(x, y)
h = -(10*y.^4 - 3*y.^3 + (20*x.^2 - 3*x+10).*y.^2 -...
    6*x.^2.*y + 10*x.^4 - 4*x.^3 + 10*x.^2)/10;
end