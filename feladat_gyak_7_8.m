syms t a0 a1 a2 a3 b0 b1 b2 b3;
px =[-2,6,10];py=[-2,-2,2]; v=[6,-4];
t0 = 0; t1 = 1; t2 =1.5;
plot(px,py,'r.','MarkerSize',20);
hold on;
axis= [-7 15 -4 11];
quiver(px(1),py(1),v(1),v(2),'y','LineWidth',3);
ex(t) = a3*t^3+a2*t^2+a1*t+a0;
ey(t) = b3*t^3+b2*t^2+b1*t+b0;
dx(t) = diff(ex,t);
dy(t) = diff(ey,t);
e1 = [ex(t0) == px(1)
      ex(t1) == px(2)
      ex(t2) == px(3)
      dx(t0) == v(1)];

e2 = [ey(t0) == py(1)
      ey(t1) == py(2)
      ey(t2) == py(3)
      dy(t0) == v(2)];
mx = solve(e1,[a0 a1 a2 a3]);
my = solve(e2,[b0 b1 b2 b3]);
x(t) = subs(ex, [a0 a1 a2 a3],[mx.a0,mx.a1,mx.a2,mx.a3]);
y(t) = subs(ey,[b0 b1 b2 b3],[my.b0,my.b1,my.b2,my.b3]);
fplot(x,y,[t0 t2],'b','LineWidth',3);


%8.feladat

px2=[px(3), 14]; py2=[py(3), -4]; VektorX2=[dx2(t2) 3]; VektorY2=[dy2(t2) 0];

