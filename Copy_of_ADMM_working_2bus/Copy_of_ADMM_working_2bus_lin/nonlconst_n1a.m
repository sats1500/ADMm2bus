function [ c,ceq ] = nonlconst_n1a(x,xt,zt)
Pd1=0.1;
Qd1=0.05;
Pd2=3.00;
Qd2=0.9861;
Vmax=1.1;
Vmin=0.9;

z12=0.281+0.0281i;
y12=1/z12;
g12=real(y12);
b12=imag(y12);
% % g12=4;
% % b12=-10;
g12=1;
b12=-1;


ceq(1,1) = Pd1-xt(1)+(xt(3)^2 + xt(4)^2 - xt(3)*x(1) - xt(4)*x(2))*g12 - (xt(3)*x(2) - xt(4)*x(1))*b12 ;%-x(5) ;
ceq(2,1) = Qd1-xt(2)+(xt(3)^2 + xt(4)^2 - xt(3)*x(1) - xt(4)*x(2))*b12 + (xt(3)*x(2) - xt(4)*x(1))*g12 ;%-(x(6)-x(7)) ;
% ceq(4,1)=x(3)-1.1;

c=[x(3) + x(4) - Vmax^2;
   -x(3) - x(4) + Vmin^2;
   -x(3)-2*Vmax*x(1)-Vmax^2;
   -x(3)+2*Vmax*x(1)-Vmax^2;
   -x(3)+2*zt(5)*x(1)-zt(5)^2;
   -x(4)-2*Vmax*x(2)-Vmax^2;
   -x(4)+2*Vmax*x(2)-Vmax^2;
   -x(4)+2*zt(6)*x(2)-zt(6)^2;
   ];
end

