xt_1 = zeros(4,Toss);
xt_2 = zeros(7,Toss);
xt_3 = zeros(5,Toss);
xt_4 = zeros(5,Toss);
xt_5 = zeros(4,Toss);

xt_hat_111 = zeros(4,Toss);
xt_hat_121 = zeros(4,Toss);
xt_hat_131 = zeros(4,Toss);


xt_hat_222 = zeros(7,Toss);
xt_hat_232 = zeros(7,Toss);
xt_hat_242 = zeros(7,Toss);


xt_hat_333 = zeros(5,Toss);
xt_hat_343 = zeros(5,Toss);
xt_hat_353 = zeros(5,Toss);


xt_hat_444 = zeros(5,Toss);
xt_hat_454 = zeros(5,Toss);
xt_hat_464 = zeros(5,Toss);


xt_hat_555 = zeros(4,Toss);
xt_hat_565 = zeros(4,Toss);
xt_hat_515 = zeros(4,Toss);

 
ey_t111 = zeros(4,Toss);
ey_t121 = zeros(4,Toss);
ey_t131 = zeros(4,Toss);


ey_t222 = zeros(7,Toss);
ey_t232 = zeros(7,Toss);
ey_t242 = zeros(7,Toss);


ey_t333 = zeros(5,Toss);
ey_t343 = zeros(5,Toss);
ey_t353 = zeros(5,Toss);


ey_t444 = zeros(5,Toss);
ey_t454 = zeros(5,Toss);
ey_t464 = zeros(5,Toss);


ey_t555 = zeros(4,Toss);
ey_t565 = zeros(4,Toss);
ey_t515 = zeros(4,Toss);



xt_hat_1 = zeros(4,Toss);
xt_hat_2 = zeros(7,Toss);
xt_hat_3 = zeros(5,Toss);
xt_hat_4 = zeros(5,Toss);
xt_hat_5 = zeros(4,Toss);

eyt_1 = zeros(1,Toss);
eyt_2 = zeros(1,Toss);
eyt_3 = zeros(1,Toss);
eyt_4 = zeros(1,Toss);
eyt_5 = zeros(1,Toss);


yt_11 = zeros(4,Toss);
yt_12 = zeros(4,Toss);
yt_13 = zeros(4,Toss);


yt_22 = zeros(7,Toss);
yt_23 = zeros(7,Toss);
yt_24 = zeros(7,Toss);

yt_33 = zeros(5,Toss);
yt_34 = zeros(5,Toss);
yt_35 = zeros(5,Toss);

yt_44 = zeros(5,Toss);
yt_45 = zeros(5,Toss);
yt_46 = zeros(5,Toss);

yt_55 = zeros(4,Toss);
yt_56 = zeros(4,Toss);
yt_51 = zeros(4,Toss);

yt_1 = zeros(4,Toss);
yt_2 = zeros(7,Toss);
yt_3 = zeros(5,Toss);
yt_4 = zeros(5,Toss);
yt_5 = zeros(4,Toss);

yn_1 = zeros(4,Toss);
yn_2 = zeros(7,Toss);
yn_3 = zeros(5,Toss);
yn_4 = zeros(5,Toss);
yn_5 = zeros(4,Toss);

et_1_ = zeros(4,Toss);
et_2_ = zeros(7,Toss);
et_3_ = zeros(5,Toss);
et_4_ = zeros(5,Toss);
et_5_ = zeros(4,Toss);



%
yt_hat_111 = zeros(4,Toss);
yt_hat_121 = zeros(4,Toss);
yt_hat_131 = zeros(4,Toss);


yt_hat_222 = zeros(7,Toss);
yt_hat_232 = zeros(7,Toss);
yt_hat_242 = zeros(7,Toss);

yt_hat_333 = zeros(5,Toss);
yt_hat_343 = zeros(5,Toss);
yt_hat_353 = zeros(5,Toss);

yt_hat_444 = zeros(5,Toss);
yt_hat_454 = zeros(5,Toss);
yt_hat_464 = zeros(5,Toss);

yt_hat_555 = zeros(4,Toss);
yt_hat_565 = zeros(4,Toss);
yt_hat_515 = zeros(4,Toss);

ext_1 = zeros(1,Toss);
ext_2 = zeros(1,Toss);
ext_3 = zeros(1,Toss);
ext_4 = zeros(1,Toss);
ext_5 = zeros(1,Toss);

% ut_1 = 2*ones(1,Toss);
% ut_2 = 2*ones(1,Toss);
% ut_3 = 2*ones(1,Toss);
% ut_4 = 2*ones(1,Toss);

ut_1 = zeros(4,Toss);
ut_2 = zeros(7,Toss);
ut_3 = zeros(5,Toss);
ut_4 = zeros(5,Toss);
ut_5 = zeros(4,Toss);



Js=cell(5,Toss);

Js{1} = zeros(1,Toss);
Js{2} = zeros(1,Toss);
Js{3} = zeros(1,Toss);
Js{4} = zeros(1,Toss);
Js{5} = zeros(1,Toss);


J_1_true = zeros(1,Toss);
J_2_true = zeros(1,Toss);
J_3_true = zeros(1,Toss);
J_4_true = zeros(1,Toss);
J_5_true = zeros(1,Toss);

minJ=cell(5,Toss);
minJ{1}=zeros(1,Toss);
minJ{2}=zeros(1,Toss);
minJ{3}=zeros(1,Toss);
minJ{4}=zeros(1,Toss);
minJ{5}=zeros(1,Toss);

It_1 = zeros(1,Toss);
It_2 = zeros(1,Toss);
It_3 = zeros(1,Toss);
It_4 = zeros(1,Toss);
It_5 = zeros(1,Toss);

% J_1 = zeros(1,Toss);
% J_2 = zeros(1,Toss);
% J_3 = zeros(1,Toss);
% J_4 = zeros(1,Toss);
% J_5 = zeros(1,Toss);
