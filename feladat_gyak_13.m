syms a0 a1 a2 a3 a4 t b0 b1 b2 b3 b4;
px =[10,20,40,50,20];py=[20,40,40,20,10];
plot(px,py,'y.','MarkerSize',20);
hold on;
t0 =0; t1 =1;t2 =2; t3 =3; t4 =4;
ex(t) = a4*t^4+a3*t^3+a2*t^2+a1*t+a0;
ey(t) = b4*t^4+b3*t^3+b2*t^2+b1*t+b0;
e1 =[ex(t0) == px(1)
     ex(t1) == px(2)
     ex(t2) == px(3)
     ex(t3) == px(4)
     ex(t4) == px(5)];

e2 =[ey(t0) == py(1)
     ey(t1) == py(2)
     ey(t2) == py(3)
     ey(t3) == py(4)
     ey(t4) == py(5)];
mx = solve(e1,[a0 a1 a2 a3 a4]);
my = solve(e2,[b0 b1 b2 b3 b4]);
x(t) = subs(ex,[a0 a1 a2 a3 a4],[mx.a0,mx.a1,mx.a2,mx.a3,mx.a4]);
y(t) = subs(ey,[b0 b1 b2 b3 b4],[my.b0,my.b1,my.b2,my.b3,my.b4]);
fplot(x,y,[t0 t4],'b','LineWidth',3);
hold on;
dx(t) = diff(x,t);
dy(t) = diff(y,t);
quiver(x(0.5),y(0.5),dx(0.5),dy(0.5),'g','LineWidth',3);