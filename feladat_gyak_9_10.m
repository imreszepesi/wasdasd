hold on; axis equal;
px =[-2,6];py =[-2,-2]; vx = [6,4];vy=[-4,4];
t0 =0; t1 =1;
plot(px,py,'y.','MarkerSize',20);
quiver(px(1),py(1),vx(1),vy(1),'g','LineWidth',3);
quiver(px(2),py(2),vx(2),vy(2),'g','LineWidth',3);
syms a0 a1 a2 a3 t b0 b1 b2 b3;
%egyenletek bevezetése
ex(t) = a3*t^3+a2*t^2+a1*t+a0; 
ey(t) = b3*t^3+b2*t^2+b1*t+b0;
%egyenletek deriváltja
dx(t) = diff(ex,t);
dy(t) = diff(ey,t);
%egyenletrendszerek
e1 = [ex(t0) == px(1)
      ex(t1) == px(2)
      dx(t0) == vx(1)
      dx(t1) == vx(2)];
e2 = [ey(t1) == py(1)
      ey(t1) == py(2)
      dy(t0) == vy(1)
      dy(t1) == vy(2)];
mx = solve(e1,[a0 a1 a2 a3]);
my= solve(e2,[b0 b1 b2 b3]);
x(t) = subs(ex,[a0 a1 a2 a3],[mx.a0,mx.a1,mx.a2,mx.a3]);
y(t) = subs(ey,[b0 b1 b2 b3],[my.b0,my.b1,my.b2,my.b3]);
fplot(x,y,[t0 t1],'b','LineWidth',3);


%10.feladat
px2= [px(2),14]; py2=[py(2),-4]; vx2=[vx(2),3];vy2= [vy(2),0];
t0=0; t1 = 2;
plot(px2,py2,'y.','MarkerSize',20);
quiver(px2(1),py2(1),vx2(1),vy2(1),'r','LineWidth',3);
quiver(px2(2),py2(2),vx2(2),vy2(2),'r','LineWidth',3);

e3=[ex(t0)==px2(1) ...      %Mivel fentebb már deklaráltunk paramétereket és egyenleteket,
   ex(t1)==px2(2) ...       %Csupán az egyenletrendszert kell átírni az összekötéshez
   dx(t0)==vx2(1) ...
   dx(t1)==vx2(2) ];
e4=[ey(t0)==py2(1) ...
    ey(t1)==py2(2) ... 
    dy(t0)==vy2(1) ...
    dy(t1)==vy2(2) ];

mx2=solve(e3, [a0 a1 a2 a3]);
my2=solve(e4, [b0 b1 b2 b3]);
y2(t)=subs(ey, [b0 b1 b2 b3], [my2.b0 my2.b1 my2.b2 my2.b3]);
x2(t)=subs(ex, [a0 a1 a2 a3], [mx2.a0 mx2.a1 mx2.a2 mx2.a3]);

fplot(x2, y2, [t0 t1], 'y', 'LineWidth', 3);







