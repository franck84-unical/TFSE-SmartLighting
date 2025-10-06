clc
clear all
close all
yalmip('clear')
global ee activies
%% Simulation description

% 5 plants
% 6 sensors
% 5 agents

% agents 1 estimates p1
% a2 estimates p2
% a3 estimates p3
% a4 estimates p4
% a5 estimates p5


% a1 is served by s1 s2 s3 
% a2 is served by s2 s3 s4
% a3 is served by s3 s4 s5
% a4 is served by s4 s5 s6
% a5 is served by s1 s5 s6

% Neighborouds
% N1 = {a2,a3,a5}
% N2 = {a1,a3,a4}
% N3 = {a1,a2,a4,a5}
% N4 = {a2,a3,a5}
% N5 = {a1,a3,a4}


%% PLANTS
model_matrices %Calcola le matrici del modello
systems_input % u(t) per ogni sotto sistema
out = sim("modello.slx"); % simulo il modello per determinare gli input mancanti ed ottenere gli stati.

u_9 = out.u_9';
u_6 = out.u_6';
u_1_2_8 = out.u_1_2_8';
u_5_7_9_11 = out.u_5_7_9_11';
u_10 = out.u_10';
u_6_19_20_21 = out.u_6_19_20_21';
u_15_16_17_18 = out.u_15_16_17_18';

outSector1 = out.outS1.signals.values';
outSector2 = out.outS2.signals.values';
outSector3 = out.outS3.signals.values';
outSector4 = out.outS4.signals.values';
outSector5 = out.outS5.signals.values';
inSector1 =out.inS1.signals.values';
inSector2 =out.inS2.signals.values';
inSector3 =out.inS3.signals.values';
inSector4 =out.inS4.signals.values';
inSector5 =out.inS5.signals.values';

%% NOISE SENSORS
% For each road, this sensors provide a noise measure that is directly
% proportional to the amount of cars that are in the road. In this case we
% suppose that the noise sensor behaviour is modeled through the road model
% (i.e. we suppose that the model output is the noise sensor measure)

noiseSector1 = out.outS1.signals.values';
noiseSector2 = out.outS2.signals.values';
noiseSector3 = out.outS3.signals.values';
noiseSector4 = out.outS4.signals.values';
noiseSector5 = out.outS5.signals.values';

%% REFERENCE CONSUMPTIONS: NOISE SENSOR IS ACCOUNTED FOR CONSUMPTIONS COMPUTATION
% Every "x" seconds the light intensity is dimmed according to the total
% vehicles presents in each road. Then the instantaneuous consumption are computed
totPoles = 100;
polesS1 = 0.1*totPoles;
polesS2 = 0.3*totPoles;
polesS3 = 0.25*totPoles;
polesS4 = 0.25*totPoles;
polesS5 = 0.1*totPoles;

kW = 50; % single pole power

consS1 = zeros(4,1); %reference consumptions computed with noise sensor
consS2 = zeros(7,1); %reference consumptions computed with noise sensor
consS3 = zeros(5,1); %reference consumptions computed with noise sensor
consS4 = zeros(5,1); %reference consumptions computed with noise sensor
consS5 = zeros(4,1); %reference consumptions computed with noise sensor

% 
for k = 1: out.tout(end)    
    consS1i = polesS1*kW*[dimming(outSector1(1,k));dimming(outSector1(2,k));dimming(outSector1(3,k));dimming(outSector1(4,k))]/100;
    consS1(:,k) = consS1i; %reference consumptions computed with noise sensor
    consS2i = polesS2*kW*[dimming(outSector2(1,k));dimming(outSector2(2,k));dimming(outSector2(3,k));dimming(outSector2(4,k));dimming(outSector2(5,k));dimming(outSector2(6,k));dimming(outSector2(7,k))]/100;
    consS2(:,k) = consS2i; %reference consumptions computed with noise sensor
    consS3i = polesS3*kW*[dimming(outSector3(1,k));dimming(outSector3(2,k));dimming(outSector3(3,k));dimming(outSector3(4,k));dimming(outSector3(5,k))]/100;
    consS3(:,k) = consS3i; %reference consumptions computed with noise sensor
    consS4i = polesS4*kW*[dimming(outSector4(1,k));dimming(outSector4(2,k));dimming(outSector4(3,k));dimming(outSector4(4,k));dimming(outSector4(5,k))]/100;
    consS4(:,k) = consS4i; %reference consumptions computed with noise sensor
    consS5i = polesS5*kW*[dimming(outSector5(1,k));dimming(outSector5(2,k));dimming(outSector5(3,k));dimming(outSector5(4,k))]/100;
    consS5(:,k) = consS5i; %reference consumptions computed with noise sensor
end


%% SENSORS to PLANT INTERACTIONS
% Plant 1
C11 = C1; %Sensor 1 plant 1
C12 = C11; %Sensor 2 plant 1
C13 = C11; %Sensor 3 plant 1
H11 = 0; H12 = H11; H13 = H11;
F11 = [1 1 0 0]'; F12 = F11; F13 = F11;
% Plant 2
C22 = C2; %Sensor 2 plant 2
C23 = C22; %Sensor 3 plant 2
C24 = C22; %Sensor 4 plant 2
H22 = H11; H23 = H11; H24 = H11;
F22 = [1 0 1 1 0 1 0]'; F23 = F22; F24 = F22;
% Plant 3
C33 = C4; %Sensor 3 plant 3
C34 = C33; %Sensor 4 plant 3
C35 = C33; %Sensor 5 plant 3
H34 = H11; H36 = H11; H37 = H11;
F33 = [1 1 0 0 0]'; F34 = F33; F35 = F33;
% Plant 4 
C44 = C4; %Sensor 4 plant 4
C45 = C44; %Sensor 5 plant 4
C46 = C44; %Sensor 6 plant 4
H44 = H11; H45 = H11; H46 = H11;
F44 = [1 1 1 0 0]'; F45 = F44; F46 = F44;
% Plant 5
C55 = C5; %Sensor 5 plant 5
C56 = C55; %Sensor 6 plant 5
C57 = C55; %Sensor 7 plant 5
H55 = H11; H56 = H11; H57 = H11;
F55 = [1 1 0 0]'; F56 = F55; F57 = F55;




%% AGENTS PARAMETERS
th = 0.5;
e_th=1;
ee=0.05;

% agent 1

beta11 = 1;
beta12 = 1;
beta13 = beta12;
mu12 = 1;
mu13 = 1;
mu15 = 1;

alpha11 = 1-ee*beta11*mu12;
alpha12 = 1-ee*beta12*mu12;
alpha13 = 1-ee*beta13*(mu12+mu13);

Max11 = alpha11-ee*beta11*mu13;
Max12 = alpha12+ee*beta12*mu12;
Max13 = alpha13+ee*beta13*(mu13+mu12)/2;


Max1 = [Max11,Max12,Max13];

g11 = 0.01;
g12 = g11;
g13 = 0.01;


alphas1 = [alpha11,alpha12,alpha13];
betas1 = [beta11,beta12,beta13];
gs1 = [g11,g12,g13];

mus1=cell(3,1);
mus1{1}=[mu13,mu15]/2;
mus1{2}=[mu12];
mus1{3}=[mu12,mu13]/2;

% agent 2

beta22 = 1;
beta23 = beta22;
beta24 = beta22;


mu21 = 1;
mu24 = 1;
mu23 = 1;

mus2=cell(3,1);
mus2{1}=[mu21];
mus2{2}=[mu21,mu23]/2;
mus2{3}=[mu24];

alpha22 = 1-ee*beta22*mu21;
alpha23 = 1-ee*beta23*(mu21+mu23);
alpha24 = 1-ee*beta24*(mu23+mu24);

Max22 = alpha22+ee*beta22*mu21;
Max23 = alpha23+ee*beta23*mu21;
Max24 = alpha24+ee*beta24*mu24;

Max2 = [Max22,Max23,Max24];

g22 = 0.01;
g23 = 0.01;
g24 = g22;

alphas2 = [alpha22,alpha23,alpha24];
betas2 = [beta22,beta23,beta24];
gs2 = [g22,g23,g24];


% agent 3

beta31 = 1;
beta35 = beta31;
beta36 = beta31;

mu31 = 1;
mu32 = 1;
mu34 = 1;
mu35 = 1;

mus3=cell(3,1);
mus3{1}=[mu31,mu32]/2;
mus3{2}=[mu32,mu34]/2;
mus3{3}=[mu34,mu35]/2;

alpha33 = 1-ee*beta31*(mu12+mu13);
alpha34 = 1-ee*beta35*(mu12+mu13);
alpha35 = 1-ee*beta36*(mu12+mu13);

Max31 = alpha33+ee*beta31*mu31;
Max35 = alpha34+ee*beta35*mu31;
Max36 = alpha35+ee*beta36*mu34;

Max3 = [Max31,Max35,Max36];

g31 = 0.03;
g35 = 0.01;
g36 = 0.03;

alphas3 = [alpha33,alpha34,alpha35];
betas3 = [beta31,beta35,beta36];
gs3 = [g31,g35,g36];

% agent 4

beta41 = 1;
beta45 = beta41;
beta46 = beta41;


mu42 = 1;
mu43 = 1;
mu45 = 1;

mus4=cell(3,1);
mus4{1}=[mu42,mu43]/2;
mus4{2}=[mu43,mu45]/2;
mus4{3}=[mu45];

alpha44 = 1-ee*beta41*(mu12+mu13);
alpha45 = 1-ee*beta45*(mu12+mu13);
alpha46 = 1-ee*beta46*mu43;

Max41 = alpha44+ee*beta41*mu42;
Max45 = alpha45+ee*beta45*mu43;
Max46 = alpha46+ee*beta46*mu43;

Max4 = [Max41,Max45,Max46];

g41 = 0.02;
g45 = 0.01;
g46 = g41;

alphas4 = [alpha44,alpha45,alpha46];
betas4 = [beta41,beta45,beta46];
gs4 = [g41,g45,g46];


% agent 5

beta51 = 1;
beta55 = beta51;
beta56 = beta51;


mu51 = 1;
mu53 = 1;
mu54 = 1;

mus5=cell(3,1);
mus5{1}=[mu51];
mus5{2}=[mu53,mu54]/2;
mus5{3}=[mu54];

alpha53 = 1-ee*beta51*mu51;
alpha55 = 1-ee*beta55*mu53;
alpha56 = 1-ee*beta56*mu54;

Max51 = alpha53+ee*beta51*mu51;
Max55 = alpha55+ee*beta55*(mu12+mu13);
Max56 = alpha56+ee*beta56*mu54;

Max5 = [Max51,Max55,Max56];

g51 = 0.02;
g55 = 0.01;
g56 = g51;

alphas5 = [alpha53,alpha55,alpha56];
betas5 = [beta51,beta55,beta56];
gs5 = [g51,g55,g56];



alphas=[alphas1;alphas2;alphas3;alphas4;alphas5];
betas=[betas1;betas2;betas3;betas4;betas5];
gs=[gs1;gs1;gs1;gs1;gs1];

%% 
sizes=[3,3,3,3];

% matrici adiacenza
Sigma_1=[0,mu15;mu51,0];
Sigma_2=[0,mu12;mu21,0];
Sigma_3=[0,mu12 mu13;mu21,0,mu23;mu31,mu32,0];
Sigma_4=[0,mu23,mu24;mu32,0,mu34;mu42,mu43,0];
Sigma_5=[0,mu34,mu35;mu43, 0,mu45;mu53,mu54,0];
Sigma_6=[0,mu54;mu45, 0];

P_1=eye(2)-ee*beta11*(flip(Sigma_1,2)-Sigma_1);
P_2=eye(2)-ee*beta11*(flip(Sigma_2,2)-Sigma_2);
P_3=eye(3)-ee*beta11*(diag(Sigma_3*ones(3,1))-Sigma_3);
P_4=eye(3)-ee*beta11*(diag(Sigma_4*ones(3,1))-Sigma_4);
P_5=eye(3)-ee*beta11*(diag(Sigma_5*ones(3,1))-Sigma_5);
P_6=eye(2)-ee*beta11*(flip(Sigma_6,2)-Sigma_6);

% Calcolo left-eigenvectors

scal=sqrt(ones(1,2)*ones(2,1));
[D,E]=eigs(P_1);
W=inv(D);
W1=W(1,:)/(scal);

[D,E]=eigs(P_2);
W=inv(D);
W2=W(1,:)/(scal);

[D,E]=eigs(P_3);
W=inv(D);
W3=W(1,:)/(scal);

[D,E]=eigs(P_4);
W=inv(D);
W4=W(1,:)/(scal);

[D,E]=eigs(P_5);
W=inv(D);
W5=W(1,:)/(scal);

[D,E]=eigs(P_6);
W=inv(D);
W6=W(1,:)/(scal);

Ws =cell(6,1);
Ws{1} = W1;
Ws{2} = W2;
Ws{3} = W3;
Ws{4} = W4;
Ws{5} = W5;
Ws{6} = W6;

