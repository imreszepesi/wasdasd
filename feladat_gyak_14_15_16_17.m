clear;
syms t;
px = [10 20 40 50 20];py = [20 40 40 20 10]; 
plot(px,py,'*--');
axis equal;
n = 4;
cx(t) = 0*t; 
cy(t) = 0*t;
for i = 0 : n
    b(t) = nchoosek(n,i) * t^i * (1-t)^(n-i);
    cx(t) = cx(t) +px(i+1)*b(t);
    cy(t) = cy(t) +py(i+1)*b(t);
end
hold on;
fplot(cx,cy,[0 1]);

%kezdő és vég érintővektor
dx(t) = diff(cx,t);
dy(t) = diff(cy,t);
a =[n*(px(2)-px(1)),n*(py(2)-py(1))];
b=[n*(px(n+1)-px(n)),n*(py(n+1)-py(n))];
quiver(cx(0),cy(0),a(1),a(2),'b','LineWidth',3);
quiver(cx(1),cy(1),b(1),b(2),'b','LineWidth',3);
%15 feladat kuka..
%16 kuka
%17 feladat:
px2 =[20 20]; py2 = [10 -40]; vx = [-60 60]; vy = [-20 0];
plot(px2,py2,'b.','MarkerSize',20);
t0 = 0; t1 =1;
syms a0 a1 a2 a3 b0 b1 b2 b3;
ex(t) =a3*t^3+a2*t^2+a1*t+a0;
ey(t) =b3*t^3+b2*t^2+b1*t+b0;
dx(t) = diff(ex,t);
dy(t) = diff(ey,t);
e1 =[ex(t0) == px2(1)
     ex(t1) == px2(2)
     dx(t0) == vx(1)
     dx(t1) == vx(2)];

e2 =[ey(t0) == py2(1)
     ey(t1) == py2(2)
     dy(t0) == vy(1)
     dy(t1) == vy(2)];
mx = solve(e1,[a0 a1 a2 a3]);
my = solve(e2,[b0 b1 b2 b3]);
x(t) = subs(ex,[a0 a1 a2 a3],[mx.a0,mx.a1,mx.a2,mx.a3]);
y(t) = subs(ey,[b0 b1 b2 b3],[my.b0,my.b1,my.b2,my.b3]);
fplot(x,y,[t0 t1],'y','LineWidth',3);
quiver(px2(1),py2(1),vx(1),vy(1),'g','LineWidth',3);
%G1 módon létezik mivel az érintővektoruk iránya megegyezik de nem
%ugyanolyan hosszú