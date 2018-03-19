function [ f ] = funname_n1a(x,zt,lam)
% c=200;
global c;
% f = lam(3)*(x(1)-zt(5)) + lam(4)*(x(2)-zt(6)) + 0.5*c*((x(1)-zt(5))^2 + (x(2)-zt(6))^2);
f = - lam(3)*(x(1)-zt(5)) - lam(4)*(x(2)-zt(6)) + 0.5*c*(x(3)-2*x(1)*zt(5)+zt(5)^2 + x(4)-2*x(2)*zt(6)+zt(6)^2);
end

