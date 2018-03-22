function [ f ] = funname_n2(x,xt,lam)
% c=200;
global c;
% f = 20*x(1) - lam(3)*(x(3)-xt(5)) - lam(4)*(x(4)-xt(6)) + 0.5*c*((x(3)-xt(5))^2 + (x(4)-xt(6))^2);
f = 30*x(1) - lam(3)*(x(3)-xt(5)) - lam(4)*(x(4)-xt(6)) + 0.5*c*((x(3)-xt(5))^2 + (x(4)-xt(6))^2);

end

