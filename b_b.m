clear
px =[-2 3 10 12]; py=[0 6 0 -7];
plot(px,py,'*--')
axis([-5 10 -6 8]); axis equal;hold on;
n = 3;
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

%érintővektor
dx(t) =  diff(cx,t);
dy(t) =  diff(cy,t);
hold on;
%kezdőpontvektor
a = [n * (px(2)-px(1)), n* (py(2)-py(1))];
quiver(cx(0),cy(0),a(1),a(2));
%végpontvektor
b = [n*(px(n+1)-px(n)),n*(py(n+1)-py(n))];
quiver(cx(1),cy(1),b(1),b(2));
%többszörösgörbe
m=4;
rx = [px(n+1),px(n+1)+n/m*(px(n+1)-px(n)),17,20,18];
ry = [py(n+1),py(n+1)+n/m*(py(n+1)-py(n)),-10,5,9];
plot(rx,ry,'g*--')
cx(t) = 0*t;
cy(t) = 0*t;
for i = 0 : m
    %beizer-keplet
    g(t) = nchoosek(m,i) * t^i * (1-t)^(m-i);
    cx(t) = cx(t) + rx(i+1) * g(t);
    cy(t) = cy(t) + ry(i+1) * g(t);
end
hold on;
fplot(cx,cy,[0 1])



