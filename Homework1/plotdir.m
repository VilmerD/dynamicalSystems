function plotdir(ax, xx, yy, s, la, K)
hold(ax, 'ON');

alph = pi/8;
for k = K
    rk = [xx(k); yy(k)];
    tk = (yy(k + 1) - yy(k))./(xx(k + 1) - xx(k));
    dx = xx(k + 1) - xx(k);
    d = sign(dx);
    beta = atan(tk) + pi*(d < 0);
    g1 = pi + beta - alph;
    L1 = la*[0 cos(g1); 0 sin(g1)] + rk;
    
    g2 = pi + beta + alph;
    L2 = la*[0 cos(g2); 0 sin(g2)] + rk;
    
    plot(ax, L1(1, :), L1(2, :), s);
    plot(ax, L2(1, :), L2(2, :), s);
end
end