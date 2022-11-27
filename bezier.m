clear
px = [10 20 40 50 20];py = [20 40 40 20 10]; 
plot(px,py,'*--')
axis([-5 10 -6 8]); axis equal;hold on;
n = 4;
syms t
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


%%pontkiértékelés
t1 = 3/4;
hold on;
plot(cx(t1),cy(t1),'*');
%érintővektor
dx(t) =  diff(cx,t);
dy(t) =  diff(cy,t);
hold on;
%kezdőpontvektor
quiver(cx(t1),cy(t1),dx(t1),dy(t1));
a = [n * (px(2)-px(1)), n* (py(2)-py(1))];
quiver(cx(0),cy(0),a(1),a(2));
%végpontvektor
b = [n*(px(n+1)-px(n)),n*(py(n+1)-py(n))];
quiver(cx(1),cy(1),b(1),b(2));
%többszörösgörbe