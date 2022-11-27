clear
px =[-2 3 7 4]; py=[0 6 0 -3];
plot(px,py,'*--')
axis([-5 10 -6 8]); axis equal;hold on;
n = 3;
syms t;
cx(t) = 0*t;
cy(t) = 0*t;
for i = 0 : n
    %beizer-keplet
    b(t) = nchoosek(n,i) * t^i * (1-t)^(n-i);
    cx(t) = cx(t) + px(i+1) * b(t);
    cy(t) = cy(t) + py(i+1) * b(t);
end
hold on;
fplot(cx,cy,[0 1])


%érintővektor
dx(t) =  diff(cx,t);
dy(t) =  diff(cy,t);
hold on;
%végpontvektor
b = [n*(px(n+1)-px(n)),n*(py(n+1)-py(n))];
quiver(cx(1),cy(1),b(1),b(2));

px2=[px(n+1),18];py2=[py(n+1),-2];
v = [3,5];
plot(px2,py2,'b.','MarkerSize',15);
quiver(px2(2),py2(2),v(1),v(2),'g','LineWidth',3);
t0 = 0; t1 = 3;
syms a0 a1 a2 a3 b0 b1 b2 b3;
ex(t) = a3*t^3+a2*t^2+a1*t+a0;
ey(t) = b3*t^3+b2*t^2+b1*t+b0;
dx(t) = diff(ex,t);
dy(t) = diff(ey,t);
e1 = [ex(t0) == px2(1)
      ex(t1) == px2(2)
      dx(t0) == b(1)
      dx(t1) == v(1)];

e2 = [ey(t0) == py2(1)
      ey(t1) == py2(2)
      dy(t0) == b(2)
      dy(t1) == v(2)];
mx = solve(e1 ,[a0 a1 a2 a3]);
my = solve(e2 ,[b0 b1 b2 b3]);
x(t) = subs(ex,[a0 a1 a2 a3],[mx.a0,mx.a1,mx.a2,mx.a3]);
y(t) = subs(ey,[b0 b1 b2 b3],[my.b0,my.b1,my.b2,my.b3]);
fplot(x,y,[t0 t1],'y','LineWidth',2)




