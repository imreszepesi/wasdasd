syms t a0 a1 a2 a3 b0 b1 b2 b3;
px=[-2,4,6,10];py=[-2,0,-2,2];
t0 = -1;
t1 = 0;
t2 = 2;
t3 =3;
plot(px,py,'k.','MarkerSize',20);
hold on;
axis equal;
ex(t) = a3*t^3+a2*t^2+a1*t+a0;
ey(t) = b3*t^3+b2*t^2+b1*t+b0;
e1 = [ex(t0) == px(1)
      ex(t1) == px(2)
      ex(t2) == px(3)
      ex(t3) == px(4)];
e2 = [ey(t0) == py(1)
      ey(t1) == py(2)
      ey(t2) == py(3)
      ey(t3) == py(4)];
mx = solve(e1,[a0 a1 a2 a3]);
my = solve(e2,[b0 b1 b2 b3]);
x(t) = subs(ex,[a0 a1 a2 a3],[mx.a0,mx.a1,mx.a2,mx.a3]);
y(t) = subs(ey,[b0 b1 b2 b3],[my.b0,my.b1,my.b2,my.b3]);
fplot(x,y,[t0 t3],'y','LineWidth',3);

dx(t) = diff(x,t);
dy(t) = diff(y,t);
quiver(x(2),y(2),dx(2),dy(2),'g','LineWidth',3);
%11 feladat:
px2=[10,14]; py2=[2,-4];
vx=[(dx(t3))/3,3];vy=[(dy(t3))/2,0];
t0 = -1; t1 =1;
dx2(t) =diff(ex,t);
dy2(t) =diff(ey,t);
plot(px2,py2,'b.','MarkerSize',20);
quiver(px2(1),py2(1),dx(t3),dy(t3),'g','MarkerSize',3);
quiver(px(2),py2(2),vy(2),vy(2),'g','MarkerSize',3);

e3 = [ex(t0) == px2(1)
      ex(t1) == px2(2)
      dx2(t0) == vx(1)
      dx2(t1) == vx(2)];
e4 = [ey(t0) == py2(1)
      ey(t1) == py2(2)
      dy2(t0) ==vy(1)
      dy2(t1) == vy(2)];
mx2 = solve(e3,[a0 a1 a2 a3]);
my2 = solve(e4,[b0 b1 b2 b3]);
x2(t) = subs(ex,[a0 a1 a2 a3],[mx2.a0,mx2.a1,mx2.a2,mx2.a3]);
y2(t) = subs(ey,[b0 b1 b2 b3],[my2.b0,my2.b1,my2.b2,my2.b3]);
fplot(x2,y2,[t0 t1],'y','LineWidth',3);
%gyak 12
px3 = [px2(2),22,24];py3=[py2(2),2,0]; vx2 =[vx(2)];vy2 =[vy(2)];
plot(px3,py3,'b.','MarkerSize',20);
quiver(px3(1),py3(1),vx2(1),vy2(1),'b','LineWidth',3);
t0 = -2;t1 =0; t2 =3;

e5=[ex(t0)==px3(1) ...      %Mivel fentebb már deklaráltunk paramétereket és egyenleteket,
    ex(t1)==px3(2) ...       %Csupán az egyenletrendszert kell átírni az összekötéshez
    ex(t2)==px3(3) ...
    dx2(t0)==vx2(1) ];
mx3=solve(e5, [a0 a1 a2 a3]);
x3(t)=subs(ex, [a0 a1 a2 a3], [mx3.a0 mx3.a1 mx3.a2 mx3.a3]);
%%%%%%%%%%%%%%%% Y Koordináták %%%%%%%%%%%%%%%%
ey(t)=b3*t^3+b2*t^2+b1*t+b0;
e6=[ey(t0)==py3(1) ...
    ey(t1)==py3(2) ... 
    ey(t3)==py3(3) ...
    dy2(t0)==(1)  ];
my3=solve(e6, [b0 b1 b2 b3]);
y3(t)=subs(ey, [b0 b1 b2 b3], [my3.b0 my3.b1 my3.b2 my3.b3]);

fplot(x3,y3,[t0 t2],'y','LineWidth',3);



