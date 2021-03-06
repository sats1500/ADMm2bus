function [ c,ceq ] = nonlconst_n1(x,zt)
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


% ceq(1,1) = Pd1-x(1)+(x(3)^2 + x(4)^2 - x(3)*zt(5) - x(4)*zt(6))*g12 - (x(3)*zt(6) - x(4)*zt(5))*b12 ;%-x(5) ;
% ceq(2,1) = Qd1-x(2)+(x(3)^2 + x(4)^2 - x(3)*zt(5) - x(4)*zt(6))*b12 + (x(3)*zt(6) - x(4)*zt(5))*g12 ;%-(x(6)-x(7)) ;
% ceq(3,1)=x(4);
% % ceq(4,1)=x(3)-1.1;
% 
% c=[x(3)^2 + x(4)^2 - Vmax^2;
%    -x(3)^2 - x(4)^2 + Vmin^2];

ceq(1,1) = Pd1-x(1)+(x(5) + x(6) - x(3)*zt(5) - x(4)*zt(6))*g12 - (x(3)*zt(6) - x(4)*zt(5))*b12 ;%-x(5) ;
ceq(2,1) = Qd1-x(2)+(x(5) + x(6) - x(3)*zt(5) - x(4)*zt(6))*b12 + (x(3)*zt(6) - x(4)*zt(5))*g12 ;%-(x(6)-x(7)) ;
ceq(3,1)=x(4);
ceq(4,1)=x(6);
% ceq(5,1)=x(3)-1.1;
% ceq(6,1)=x(5)-1.21;

c=[x(5) + x(6) - Vmax^2;
   -x(5) - x(6) + Vmin^2;
   -x(5)-2*Vmax*x(3)-Vmax^2;
   -x(5)+2*Vmax*x(3)-Vmax^2;
   -x(5)+2*zt(3)*x(3)-zt(3)^2;
   -x(6)-2*Vmax*x(4)-Vmax^2;
   -x(6)+2*Vmax*x(4)-Vmax^2;
   -x(6)+2*zt(4)*x(4)-zt(4)^2;
   ];
end

