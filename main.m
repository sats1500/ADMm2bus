clc;
clear all;
global c;
c=2000;
Vmax=1.1;
Vmin=0.9;

Pg1max=2.00;
Pg1min=0;
Pg2max=2.50;
Pg2min=0;
Qg1max=0.30;
Qg1min=-0.30;
Qg2max=1.275;
Qg2min=-1.275;

Pd1=0.1;
Qd1=0.05;
Pd2=3.00;
Qd2=0.9861;

z12=0.00281+0.0281i;
y12=1/z12;
g12=real(y12);
b12=imag(y12);
% g12=1;
% b12=-1;

%%
    %var Pg1 Qg1 Pg2 Qg2 e1 f1 e2 f2
    ub=[Pg1max Qg1max Pg2max Qg2max Vmax*ones(1,4) ];
    lb=[Pg1min Qg1min Pg2min Qg2min -Vmax*ones(1,4)];
    x0=[1.0    0      1.0    0      1  0  1  0];
    A=[];
    b=[];
    Aeq=[];
    beq=[];
    options = optimoptions('fmincon','Display','iter');
    [x_cen,fval,exitflag,output,lambda] = fmincon(@(x)funname(x),x0,A,b,Aeq,beq,lb,ub,@(x)nonlconst(x),options);
    x_cen
    lambda.eqnonlin
%     pf12=(x(5)^2 + x(6)^2 - x(7)*x(5) - x(8)*x(6))*g12 - (x(5)*x(8) - x(6)*x(7))*b12
%     pf21=(x(7)^2 + x(8)^2 - x(7)*x(5) - x(8)*x(6))*g12 - (x(7)*x(6) - x(8)*x(5))*b12
%%
zt=[1.0, 0.0, 1.0, 0.0, 1.0, 0.0];
lam=200*ones(1,4);
% c=200;


for i=1:500
    %var Pg1 Qg1 e1x f1x e2x f2x 
    ub=[Pg1max Qg1max Vmax*ones(1,4) ];
    lb=[Pg1min Qg1min -Vmax*ones(1,4) ];
    x0=[1.0    0      1  0  1 0];
    A=[];
    b=[];
    Aeq=[];
    beq=[];
    options = optimoptions('fmincon','Display','off');
    [x,fval,exitflag,output,lambda] = fmincon(@(x)funname_n1(x,zt,lam),x0,A,b,Aeq,beq,lb,ub,@(x)nonlconst_n1(x),options);
    xt(1)=x(1);
    xt(2)=x(2);
    xt(3)=x(3);
    xt(4)=x(4);
    xt(5)=x(5);
    xt(6)=x(6);
    lam1= lambda.eqnonlin(1);
    if exitflag~=1
        display('not optimal');
    end
    %var Pg2 Qg2 e1z f1z e2z f2z 
    ub=[Pg2max Qg2max Vmax*ones(1,4)];
    lb=[Pg2min Qg2min -Vmax*ones(1,4)];
    x0=[1.0    0      1  0 1 0 ];
    A=[];
    b=[];
    Aeq=[];
    beq=[];
    options = optimoptions('fmincon','Display','off');
    [x,fval,exitflag,output,lambda] = fmincon(@(x)funname_n2(x,xt,lam),x0,A,b,Aeq,beq,lb,ub,@(x)nonlconst_n2(x),options);
%     pf=(x(3)^2 + x(4)^2 - x(3)*vopt(1) - x(4)*vopt(2))*g12 - (x(3)*vopt(2) - x(4)*vopt(1))*b12
    zt(1)=x(1);
    zt(2)=x(2);
    zt(3)=x(3);
    zt(4)=x(4);
    zt(5)=x(5);
    zt(6)=x(6);
    lam2= lambda.eqnonlin(1);
    if exitflag~=1
        display('not optimal');
    end
    
    %update
    lam(1)=lam(1)+c*(xt(3)-zt(3));
    lam(2)=lam(2)+c*(xt(4)-zt(4));
    lam(3)=lam(3)+c*(xt(5)-zt(5));
    lam(4)=lam(4)+c*(xt(6)-zt(6));
    
    
    output_tot(i,:)=[xt,zt,lam];
    
end