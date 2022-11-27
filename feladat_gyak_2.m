syms x y;
z(x,y) = sqrt(1-x^2-0.5*y^2);
fsurf(z);
hold on ;
axis equal;
plot3(0.5,1.2,z(1.5,0.2),'b*','MarkerSize',20);