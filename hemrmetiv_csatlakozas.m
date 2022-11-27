clear
px =[-2  6];
py = [-2 -3];
plot(px,py,'b*')
axis([-4 8 -8 6]);
axis equal;
xlabel('x');ylabel('y');
t0 =-1;
t1 =4; 
hold on;
vx = [3 3]; vy=[2 -3];
quiver(px(1),py(1),vx(1),vy(1));
quiver(px(2),py(2),vx(2),vy(2));
syms a3 a2 a1 a0 t
cx(t) = a3 *t^3 + a2 *t^2 + a1 * t + a0;
cxd(t) = diff(cx, t);
e = [cx(t0) == px(1)
     cx(t1) == px(2)
     cxd(t0) == vx(1)
     cxd(t1) == vx(2)];
m = solve(e, [a3 a2 a1 a0]);
x(t) = subs(cx, [a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0]);



syms b3 b2 b1 b0 
cy(t) = b3 *t^3 + b2 *t^2 + b1 * t + b0;
cyd(t) = diff(cy, t);
e = [cy(t0) == py(1)
     cy(t1) == py(2)
     cyd(t0) == vy(1)
     cyd(t1) == vy(2)];
m = solve(e, [b3 b2 b1 b0]);
y(t) = subs(cy, [b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0]);
fplot(x, y, [t0 t1])
%c1 folytonos
r2 = [15,0];
v2 = [2,6];
tt0 = 0;tt1=2;
plot(px(2),py(2),'b.','MarkerSize',20);
plot(r2(1),r2(2),'b.','MarkerSize',20);
quiver(px(2),py(2),vx(2),vy(2),'g','LineWidth',3);
quiver(r2(1),r2(2),v2(1),v2(2),'g','LineWidth',3);
e1 =[cx(tt0) == px(2)
     cx(tt1) == r2(1)
     cxd(tt0) == vx(2)
     cxd(tt1) == v2(1)];
e2 =[cy(tt0) == py(2)
     cy(tt1) == r2(2)
     cyd(tt0) == vy(2)
     cyd(tt1) == v2(2)];
mx = solve(e1,[a0 a1 a2 a3]);
my = solve(e2,[b0 b1 b2 b3]);
x2(t) = subs(cx,[a0 a1 a2 a3],[mx.a0,mx.a1,mx.a2,mx.a3]);
y2(t) = subs(cy,[b0 b1 b2 b3],[my.b0,my.b1,my.b2,my.b3]);
fplot(x2,y2,[tt0 tt1],'b','LineWidth',3)













