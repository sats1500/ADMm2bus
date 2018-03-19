function [ f ] = funname_n1(x,zt,lam)
% c=200;
global c;
f = 10*x(1) + lam(1)*(x(3)-zt(3)) + lam(2)*(x(4)-zt(4)) + lam(3)*(x(5)-zt(5)) + lam(4)*(x(6)-zt(6)) + 0.5*c*((x(3)-zt(3))^2 + (x(4)-zt(4))^2 + (x(5)-zt(5))^2 + (x(6)-zt(6))^2);
end

