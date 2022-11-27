syms a0 a1 a2 a3 t b0 b1 b2 b3;
px =[3,4,5];py = [0,2,-2];v =[1,2];
plot(px,py,'b.','MarkerSize',20);
hold on;
quiver(px(1),py(1),v(1),v(2),'r','LineWidth',3);
t0 = -1; t1 =0.2;t2 = 1.3;
ex(t) = a3^t^3+a2*t^2+a1*t+a0;
ey(t) = b3^t^3+b2*t^2+b1*t+b0;
dx(t) = diff(ex,t);
dy(t) = diff(ey,t);
e1 = [ex(t0) == px(1)
      ex(t1) == px(2)
      ex(t2) == px(3)
      dx(t0) ==v(1)];
e2 = [ey(t0) == py(1)
      ey(t1) == py(2)
      ey(t2) == py(3)
      dy(t0) ==v(2)];
mx = solve(e1,[a0 a1 a2 a3]);
my = solve(e2, [b0 b1 b2 b3]);
hold on;x(t) = subs(ex,[a0 a1 a2 a3],[mx.a0,mx.a1,mx.a2,mx.a3]); 
y(t) = subs(ey,[b0 b1 b2 b3],[my.b0,my.b1,my.b2,my.b3]);
fplot(x,y,[t0 t2],'y','LineWidth',3)