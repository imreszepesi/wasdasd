syms u v ;
P1 =[0,0,0]; P2 = [0,1,1]; R1 =[1,0,1];R2 =[1,1,0];
px(u) = (1-u)*P1(1)+u*P2(1);
py(u) = (1-u)*P1(2)+u*P2(2);
pz(u) = (1-u)*P1(3)+u*P2(3);
rx(u) = (1-u)*R1(1)+u*R2(1);
ry(u) = (1-u)*R1(2)+u*R2(2);
rz(u) = (1-u)*R1(3)+u*R2(3);

sx(u,v) = (1-v)*px(u)+v*rx(u);
sy(u,v) = (1-v)*py(u)+v*ry(u);
sz(u,v) = (1-v)*pz(u)+v*rz(u);
fplot3(px(u),py(u),pz(u),[0 1],'b','LineWidth',3);
hold on;
fplot3(rx(u),ry(u),rz(u),[0 1],'r','LineWidth',3);
fsurf(sx,sy,sz,[0 1 0 1],'y','LineWidth',3);