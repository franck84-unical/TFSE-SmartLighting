function [L,sol] = observer(A,C,Bd1,Dd1)
Dd1 = Dd1*1;
smallnum = 0.000001;
[n,m] = size(A);
%define decision variables
P = sdpvar(n);
% Z = sdpvar(n);
Gd = sdpvar(n);
gamma = sdpvar(1);

%Build LMI
Mat3 = [P              (P*A - Gd*C)     (P*Bd1 - Gd*Dd1)    zeros(n,n);
       (P*A - Gd*C)'        P               zeros(n,1)         C';
       (P*Bd1 - Gd*Dd1)' zeros(1,n)         gamma             Dd1';
        zeros(n,n)          C                Dd1             gamma*eye(n)];

%define constraints
F = [];
F = [F; Mat3>=smallnum*eye(size(Mat3))];
F = [F; P >=smallnum*eye(size(P))];


%optimize
sol = optimize(F,gamma,sdpsettings('solver','sedumi'));

%print optimal H2 observer
L = (value(P))\value(Gd);




% % Agent 1
% [n,m] = size(A);
% %[p,r] = size(C);
% P1 = sdpvar(n);
% G1 = sdpvar(n);
% Y1 = sdpvar(n);
% mu1 = sdpvar(1);
% 
% FF = [G1+G1'-P1 G1*A-Y1*C G1;
%     (G1*A-Y1*C)' P1-eye(n) zeros(n,m);
%     (G1)' zeros(n,m)' mu1*eye(n)]>=0
% 
% FF = FF+[G1>=0]+[P1>=0];
% 
% 
% 
% sol = optimize(FF,mu1,sdpsettings('solver','lmilab'));
% mu1
% L = double(G1)\double(Y1);
% end

% % Agent 1
% P1 = sdpvar(4);
% G1 = sdpvar(4);
% Y1 = sdpvar(4);
% mu1 = sdpvar(1);
% 
% FF = [G1+G1'-P1 G1*A1-Y1*C12 G1;
%     (G1*A1-Y1*C12)' P1-eye(4) zeros(4,4);
%     (G1)' zeros(4,4)' mu1*eye(4)]>=0;
% 
% %
% % % FF=[G1+G1'-P1 G1*A1-Y1*C12 -Y1*F12;
% % %     (G1*A1-Y1*C12)' P1-eye(2) zeros(2,1);
% % %     (-Y1*F12)' zeros(2,1)' mu1*eye(1)]>=0;
% FF = FF+[G1>=0]+[P1>=0];
% 
% 
% 
% sol1 = optimize(FF,mu1,sdpsettings('solver','lmilab'));
% 
% L111 = inv(double(G1))*double(Y1);