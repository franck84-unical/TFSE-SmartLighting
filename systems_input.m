%7000:70=tfinal:x
%x=70*tfinal/7000
tfinal = 1000;
T = tfinal;
t = 0:1:tfinal-1;   %Time vector 
x=round(70*tfinal/7000);
%PLANT 1
u1 = [ones(1,T-80*x), zeros(1,T-90*x), ones(1,T-70*x), zeros(1,T-90*x), ones(1,T-70*x)];%1
%U1 = timeseries(u1,t);
u2 = [ones(1,T-90*x), zeros(1,T-80*x), ones(1,T-65*x), zeros(1,T-95*x), ones(1,T-70*x)];%2
%U2 = timeseries(u2,t);
u8 = [ones(1,T-90*x), zeros(1,T-80*x), ones(1,T-65*x), zeros(1,T-95*x), ones(1,T-70*x)];%8
%U8 = timeseries(u8,t);
u_9 = zeros(1,T); %  u9 = r9*a0i 
%U_9 = timeseries(u_9,t);
%PLANT 2
u3 = [ones(1,T-70*x), zeros(1,T-90*x), ones(1,T-80*x), zeros(1,T-80*x), ones(1,T-80*x)];%3
u4 = [ones(1,T-85*x), zeros(1,T-95*x), ones(1,T-70*x), zeros(1,T-60*x), ones(1,T-90*x)];%4
u5 = [ones(1,T-80*x), zeros(1,T-95*x), ones(1,T-75*x), zeros(1,T-85*x), ones(1,T-65*x)];%5
u_6 = zeros(1,T); %  u6 = r10*a0i
u7 = [ones(1,T-90*x), zeros(1,T-80*x), ones(1,T-65*x), zeros(1,T-95*x), ones(1,T-70*x)];%7
u11 = [ones(1,T-70*x), zeros(1,T-90*x), ones(1,T-80*x), zeros(1,T-80*x), ones(1,T-80*x)];%11
u_1_2_8 = zeros(1,T); %  u1_2_8 = A1(1,4)r1+A1(2,4)r2+A1(3,4)r8;
%PLANT 3
u12 = [ones(1,T-80*x), zeros(1,T-95*x), ones(1,T-75*x), zeros(1,T-85*x), ones(1,T-65*x)];%12
u13 = [ones(1,T-70*x), zeros(1,T-90*x), ones(1,T-80*x), zeros(1,T-80*x), ones(1,T-80*x)];%13
u14 = [ones(1,T-80*x), zeros(1,T-90*x), zeros(1,T-70*x), zeros(1,T-90*x), ones(1,T-70*x)];%14
u_5_7_9_11 = zeros(1,T); %  u_5_7_9_11 = A2(3,4)r5+A2(5,4)r7+A2(6,4)r9+A2(7,4)r11
u_10 = zeros(1,T); %u10 =r10*a0i 
%%%
%PLANT 4
u15 = [ones(1,T-85*x), zeros(1,T-95*x), ones(1,T-70*x), zeros(1,T-60*x), ones(1,T-90*x)];%15
u16 = [ones(1,T-80*x), zeros(1,T-95*x), ones(1,T-75*x), zeros(1,T-85*x), ones(1,T-65*x)];%16
u17 = [ones(1,T-80*x), zeros(1,T-90*x), ones(1,T-70*x), zeros(1,T-90*x), ones(1,T-70*x)];%17
u18 = [ones(1,T-90*x), zeros(1,T-80*x), ones(1,T-65*x), zeros(1,T-95*x), ones(1,T-70*x)];%18
u_6_19_20_21 = zeros(1,T); %u_6_20_21 =(A3(1,2)r6+A5(2,1)r19+A5(3,1)r20+A5(4,1)r21)*a_0i
%PLANT 5
u19 = [ones(1,T-85*x), zeros(1,T-95*x), ones(1,T-70*x), zeros(1,T-60*x), ones(1,T-90*x)];%19
u20 = [ones(1,T-70*x), zeros(1,T-90*x), ones(1,T-80*x), zeros(1,T-80*x), ones(1,T-80*x)];%20
u21 = [ones(1,T-85*x), zeros(1,T-95*x), ones(1,T-65*x), zeros(1,T-95*x), ones(1,T-60*x)];%21
u_15_16_17_18 = zeros(1,T); %u_15_16_17_18 = (A4(2,1)r15+A4(3,1)r16+A4(4,1)r17+A4(5,1)r18)*a_0i