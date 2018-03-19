function [ c,ceq ] = nonlconst_n2a(x,zt)
Pd1=0;
Qd1=0;
Pd2=3.00;
Qd2=0.9861;
Vmax=1.1;
Vmin=0.9;

z12=0.00281+0.0281i;
y12=1/z12;
g12=real(y12);
b12=imag(y12);
% % g12=4;
% % b12=-10;
g12=1;
b12=-1;

% ceq(1,1) = Pd2-zt(1)+(zt(5)^2 + zt(6)^2 - zt(5)*x(1) - zt(6)*x(2))*g12 - (zt(5)*x(2) - zt(6)*x(1))*b12 ;%-x(5) ;
% ceq(2,1) = Qd2-zt(2)+(zt(5)^2 + zt(6)^2 - zt(5)*x(1) - zt(6)*x(2))*b12 + (zt(5)*x(2) - zt(6)*x(1))*g12 ;%-(x(6)-x(7)) ;
ceq(3,1) = x(2);
ceq(4,1) = x(1)-1.1;
c=[x(1)^2 + x(2)^2 - Vmax^2;
   -x(1)^2 - x(2)^2 + Vmin^2];
end

