function [ c,ceq ] = nonlconst_n2(x,xt)
Pd1=0.1;
Qd1=0.05;
Pd2=3.00;
Qd2=0.9861;
Vmax=1.1;
Vmin=0.9;

z12=0.00281+0.0281i;
y12=1/z12;
g12=real(y12);
b12=imag(y12);
g12=4;
b12=-10;
g12=1;
b12=-1;


ceq(1,1) = Pd2-x(1)+(x(5) + x(6) - x(3)*xt(3) - x(4)*xt(4))*g12 - (x(3)*xt(4) - x(4)*xt(3))*b12 ;%-x(5) ;
ceq(2,1) = Qd2-x(2)+(x(5) + x(6) - x(3)*xt(3) - x(4)*xt(4))*b12 + (x(3)*xt(4) - x(4)*xt(3))*g12 ;%-(x(6)-x(7)) ;

% ceq(4,1) = x(3)-1.1;
c=[x(5) + x(6) - Vmax^2;
   -x(5) - x(6) + Vmin^2;
   -x(5)-2*Vmax*x(3)-Vmax^2;
   -x(5)+2*Vmax*x(3)-Vmax^2;
   -x(5)+2*xt(5)*x(3)-xt(5)^2;
   -x(6)-2*Vmax*x(4)-Vmax^2;
   -x(6)+2*Vmax*x(4)-Vmax^2;
   -x(6)+2*xt(6)*x(4)-xt(6)^2;
   ];
end

