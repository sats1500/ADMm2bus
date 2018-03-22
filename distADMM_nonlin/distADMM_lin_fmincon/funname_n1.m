function [ f ] = funname_n1(x,zt,lam)
% c=200;
global c;
% f = 10*x(1) + lam(1)*(x(3)-zt(3)) + lam(2)*(x(4)-zt(4)) + 0.5*c*((x(3)-zt(3))^2 + (x(4)-zt(4))^2);
f = 10*x(1) + lam(1)*(x(3)-zt(3)) + lam(2)*(x(4)-zt(4)) + 0.5*c*((x(3)-zt(3))^2 + (x(4)-zt(4))^2);
end

