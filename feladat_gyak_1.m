syms t u v;
u0 = 10; v0=15;
x(u,v) = u-(u^3/3)+u*v^2;
y(u,v) = v-(v^3/3)+v*u^2;
z(u,v) = u^2-v^2;
xlabel('x');
ylabel('y');
zlabel('z');
fsurf(x,y,z,[-25 25 -25 25],'y','Linewidth',3);
hold on;
plot3(x(u0,v0),y(u0,v0),z(u0,v0),'b.','Markersize',20);
%paramétervonalak
ux(v) = x(u0,v);
uy(v) = y(u0,v);
uz(v) = z(u0,v);

vx(u) = x(u,v0);
vy(u) = y(u,v0);
vz(u) = z(u,v0);
fplot3(ux,uy,uz,[-25 25],'b','LineWidth',3);
fplot3(vx,vy,vz,[-25 25],'g','LineWidth',3);

%érintővektorok kiszámitása:. x_x
dux = diff(ux,v);
duy = diff(uy,v);
duz = diff(uz,v);

dvx = diff(vx,u);
dvy = diff(vy,u);
dvz = diff(vz,u);
hold on;
%ezek megrajzolása:
quiver3(x(u0,v0),y(u0,v0),z(u0,v0),dux(v0),duy(v0),duz(v0),'b','LineWidth',3);
quiver3(x(u0,v0),y(u0,v0),z(u0,v0),dvx(u0),dvy(u0),dvz(u0),'g','LineWidth',3);
%normálvektor kiszámoilása:
a =[dux(v0),duy(v0),duz(v0)];
b =[dvx(u0),dvy(u0),dvz(u0)];
normv = cross(a,b)/100;
quiver3(x(u0,v0),y(u0,v0),z(u0,v0),normv(1),normv(2),normv(3),'b','LineWidth',3);
