%H-B
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

%bezier görbe
n=4;
rx =[px(2),px(2)+vx(2)/n,10,15,13]; ry=[py(2),py(2)+vy(2)/n,-5,-2,2];
plot(rx,ry,'*--')
ex(t) = 0*t;
ey(t) = 0*t;
for i = 0 : n
    %beizer-keplet
    b(t) = nchoosek(n,i) * t^i * (1-t)^(n-i);
    ex(t) = ex(t) + rx(i+1) * b(t);
    ey(t) = ey(t) + ry(i+1) * b(t);
end
hold on;
fplot(ex,ey,[0 1])
b = [n*(rx(n+1)-rx(n)),n*(ry(n+1)-ry(n))];
quiver(ex(1),ey(1),b(1),b(2));





