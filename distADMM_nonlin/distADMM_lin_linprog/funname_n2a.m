function [ f ] = funname_n2a(x,xt,lam)
% c=200;
global c;
f = + lam(1)*(x(1)-xt(3)) + lam(2)*(x(2)-xt(4)) + 0.5*c*(x(3)-2*x(1)*xt(3)+xt(3)^2 + x(4)-2*x(2)*xt(4)+xt(4)^2);
end

