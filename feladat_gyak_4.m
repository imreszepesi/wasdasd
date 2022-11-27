syms x y z ;
eq1(x,y,z) = x+y-z;
eq2(x,y,z) = x-2*y+3*z-4;
eq3(x,y,z) = 2*x-0.5*y+4*z+2;
hold on;
fimplicit3(eq1,'b');
fimplicit3(eq2,'y');
fimplicit3(eq3,'g');
e = [eq1 == 0,eq2 == 0,eq3 == 0];
m = solve(e,[x,y,z]);
for i = 1:length(m)
    M=[m.x(i), m.y(i),m.z(i)];
    plot3(M(1), M(2), M(3),'r.','MarkerSize',100);
end