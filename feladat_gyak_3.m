syms x y ;
z = sin(x)+cos(y)/x;
axis equal;
fsurf(z,[0.1 5 -6 6],'y','LineWidth',3)
fx(x,y) = 0*x+0*x;
hold on;
fsurf(fx,[0.1 6 -6 6],'r');