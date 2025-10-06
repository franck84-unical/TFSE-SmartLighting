
init
close all
yalmip('clear')
global activies stati H_bad stati_1 inactivies  Jmin 
global L_out R_in l_out tau repaired eps L11



L_out{1}=[];
L_out{2}=[];
L_out{3}=[];
L_out{4}=[];
L_out{5}=[];

R_in{1}=[];
R_in{2}=[];
R_in{3}=[];
R_in{4}=[];
R_in{5}=[];

l_out=zeros(1,5);
repaired{1}=[];
repaired{2}=[];
repaired{3}=[];
repaired{4}=[];
repaired{5}=[];
ray=50;
% 
time_off=20;



%% NOMINAL AMPLITUDE
% Imax=30;
% err = 0.5; %al momento considerato fisso
% Inom = Imax./(dist.^2);
% err=min(Imax/100-Imax./(dist.^2));

calcolo_matrici_osservatore

%% SIMULATIONS
Toss = out.tout(end)-1;
init_strutture_dati


coeff= 0.0001;
eps=0.1;
definizione_fault4



for t=1:Toss-1
    [y1,y2,y3,xp] = road_model(A1,B1,C11,C12,C13,D1,H11*ones(4,1),F11,inSector1(:,t),xt_1(:,t),0,fault_1(t),fault_2(t),fault_3(t));
    xt_1(:,t+1) = xp;
    yt_11(:,t) = y1;
    yt_12(:,t) = y2;
    yt_13(:,t) = y3;
        [y1,y2,y3,xp] = road_model(A1,B1,C11,C12,C13,D1,H11*ones(4,1),F11,inSector1(:,t),xt_1(:,t),0,0,0,0);
        yn_1(:,t) = y1; %misura del sensore di rumore acustico (fault free)
    [y1,y2,y3,xp] = road_model(A2,B2,C22,C23,C24,D2,H22*ones(7,1),F22,inSector2(:,t),xt_2(:,t),0,fault_2(t),fault_3(t),fault_4(t));
    xt_2(:,t+1) = xp;
    yt_22(:,t) = y1;
    yt_23(:,t) = y2;
    yt_24(:,t) = y3;
        [y1,y2,y3,xp] = road_model(A2,B2,C22,C23,C24,D2,H22*ones(7,1),F22,inSector2(:,t),xt_2(:,t),0,0,0,0);
        yn_2(:,t) = y1; %misura del sensore di rumore acustico (fault free)
    [y1,y2,y3,xp] = road_model(A3,B3,C33,C34,C35,D3,H34*ones(5,1),F33,inSector3(:,t),xt_3(:,t),0,fault_3(t),fault_4(t),fault_5(t));
    xt_3(:,t+1) = xp;
    yt_33(:,t) = y1;
    yt_34(:,t) = y2;
    yt_35(:,t) = y3;
        [y1,y2,y3,xp] = road_model(A3,B3,C33,C34,C35,D3,H34*ones(5,1),F33,inSector3(:,t),xt_3(:,t),0,0,0,0);
        yn_3(:,t) = y1; %misura del sensore di rumore acustico (fault free)
    [y1,y2,y3,xp] = road_model(A4,B4,C44,C45,C46,D4,H44*ones(5,1),F44,inSector4(:,t),xt_4(:,t),0,fault_4(t),fault_5(t),fault_6(t));
    xt_4(:,t+1) = xp;
    yt_44(:,t) = y1;
    yt_45(:,t) = y2;
    yt_46(:,t) = y3;
        [y1,y2,y3,xp] = road_model(A4,B4,C44,C45,C46,D4,H44*ones(5,1),F44,inSector4(:,t),xt_4(:,t),0,0,0,0);
        yn_4(:,t) = y1; %misura del sensore di rumore acustico (fault free)
    [y1,y2,y3,xp] = road_model(A5,B5,C55,C56,C57,D5,H55*ones(4,1),F55,inSector5(:,t),xt_5(:,t),0,fault_5(t),fault_6(t),fault_1(t));
    xt_5(:,t+1) = xp;
    yt_55(:,t) = y1;
    yt_56(:,t) = y2;
    yt_51(:,t) = y3;
        [y1,y2,y3,xp] = road_model(A5,B5,C55,C56,C57,D5,H55*ones(4,1),F55,inSector5(:,t),xt_5(:,t),0,0,0,0);
        yn_5(:,t) = y1; %misura del sensore di rumore acustico (fault free)
end

yt_1(:,1) = xt_1(:,1);
yt_2(:,1) = xt_2(:,1);
yt_3(:,1) = xt_3(:,1);
yt_4(:,1) = xt_4(:,1);
yt_5(:,1) = xt_5(:,1);



xt_hat_111(:,1) = xt_1(:,1);
xt_hat_121(:,1) = xt_1(:,1);
xt_hat_131(:,1) = xt_1(:,1);


xt_hat_222(:,1) = xt_2(:,1);
xt_hat_232(:,1) = xt_2(:,1);
xt_hat_242(:,1) = xt_2(:,1);


xt_hat_333(:,1) = xt_3(:,1);
xt_hat_343(:,1) = xt_3(:,1);
xt_hat_353(:,1) = xt_3(:,1);


xt_hat_444(:,1) = xt_4(:,1);
xt_hat_454(:,1) = xt_4(:,1);
xt_hat_464(:,1) = xt_4(:,1);


xt_hat_555(:,1) = xt_5(:,1);
xt_hat_565(:,1) = xt_5(:,1);
xt_hat_515(:,1) = xt_5(:,1);



xt_hat_1(:,1) = xt_1(:,1);
xt_hat_2(:,1) = xt_2(:,1);
xt_hat_3(:,1) = xt_3(:,1);
xt_hat_4(:,1) = xt_4(:,1);
xt_hat_5(:,1) = xt_5(:,1);








activies=cell(5,1);
activies{1}=1:3;
activies{2}=1:3;
activies{3}=1:3;
activies{4}=1:3;
activies{5}=1:3;
H_bad=cell(5,1);
stati_h=zeros(5,Toss);
stati=zeros(5,1);
stati_1=stati;

stati_t=zeros(5,Toss);

inactivies=cell(5,1);
inactivies{1}=Inf(3,1);
inactivies{2}=Inf(3,1);
inactivies{3}=Inf(3,1);
inactivies{4}=Inf(3,1);
inactivies{5}=Inf(3,1);

Jmin=zeros(5,Toss);

tau= cell(5,3);
for i=1:5
    for j=1:3
   tau{i,j}=zeros(1,Toss);
   tau{i,j}(1)=1;
   tau{i,j}(2)=1;
    end
    
end
tau_s = cell(6,1);
th=0.5;

% It_i (i=1...5) rappresenta il consumo istantaneo dell'i-simo settore
% calcolato sulla base del traffico compleesivo nello stesso.
It_1(1) = 0;% Vedere come inizializzarlo
It_2(1) = 0;
It_3(1) = 0;
It_4(1) = 0;
It_5(1) = 0;

Jmax = ones(5,Toss);
I1 = zeros(1,Toss);
I2 = zeros(1,Toss);
I3 = zeros(1,Toss);
I4 = zeros(1,Toss);
I5 = zeros(1,Toss);
J1 = zeros(1,Toss);
J2 = zeros(1,Toss);
J3 = zeros(1,Toss);
J4 = zeros(1,Toss);
J5 = zeros(1,Toss);


% Consumi istantanei nei settori da calcolare sulla base delle stime
inst_cons_S1 = zeros(1,Toss);
inst_cons_S2 = zeros(1,Toss);
inst_cons_S3 = zeros(1,Toss);
inst_cons_S4 = zeros(1,Toss);
inst_cons_S5 = zeros(1,Toss);
inst_cons_S1(:,1) = polesS1*kW*dimming(0)/100;
inst_cons_S2(:,1) = polesS2*kW*dimming(0)/100;
inst_cons_S3(:,1) = polesS3*kW*dimming(0)/100;
inst_cons_S4(:,1) = polesS4*kW*dimming(0)/100;
inst_cons_S5(:,1) = polesS5*kW*dimming(0)/100;



for t=2:Toss-1
    
    stati_h(:,t)=stati;
    stati_t(:,t)=stati;
 
    if t==250  % 1^ riparazione s6
         R_in{5}=[R_in{5},3];
         R_in{4}=[R_in{4},3];
         tau{5,3}(t)=1;        
         tau{4,2}(t)=1;
    end

%     if t==430 && simNumber == 2 % riparazione s5
%          R_in{5}=[R_in{5},2];
%          R_in{4}=[R_in{4},2];
%          R_in{3}=[R_in{3},3];
%          tau{5,2}(t)=1;        
%          tau{4,2}(t)=1;
%          tau{3,3}(t)=1;
%     end
%     
    if t==500 && simNumber == 2 % riparazione s3
         R_in{1}=[R_in{1},3];
         R_in{2}=[R_in{2},2];
         R_in{3}=[R_in{3},1];
         tau{1,3}(t)=1;        
         tau{2,2}(t)=1;
         tau{3,1}(t)=1;
    end
    
%     if t==740 
%         % riparazione s4
%          R_in{2}=[R_in{2},3];
%          R_in{3}=[R_in{3},2];
%          R_in{4}=[R_in{4},1];
%          tau{2,3}(t)=1;        
%          tau{3,2}(t)=1;
%          tau{4,1}(t)=1;
%         %2^ riparazione s6
%          R_in{5}=[R_in{5},3];
%          R_in{4}=[R_in{4},3];
%          tau{5,3}(t)=1;        
%          tau{4,2}(t)=1;
%     end



    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Observers
    [haty,hatxp] = road_observer(A1,B1,C11,D1,L111,inSector1(:,t),xt_hat_111(:,t),yt_11(:,t)); 
    yt_hat_111(:,t) = haty;
    xt_hat_111(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A1,B1,C12,D1,L121,inSector1(:,t),xt_hat_121(:,t),yt_12(:,t));  
    yt_hat_121(:,t) = haty;
    xt_hat_121(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A1,B1,C13,D1,L131,inSector1(:,t),xt_hat_131(:,t),yt_13(:,t));    
    yt_hat_131(:,t) = haty;
    xt_hat_131(:,t+1) = hatxp;

    [haty,hatxp] = road_observer(A2,B2,C22,D2,L222,inSector2(:,t),xt_hat_222(:,t),yt_22(:,t));    
    yt_hat_222(:,t) = haty;
    xt_hat_222(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A2,B2,C23,D2,L232,inSector2(:,t),xt_hat_232(:,t),yt_23(:,t));    
    yt_hat_232(:,t) = haty;
    xt_hat_232(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A2,B2,C24,D2,L242,inSector2(:,t),xt_hat_242(:,t),yt_24(:,t));    
    yt_hat_242(:,t) = haty;
    xt_hat_242(:,t+1) = hatxp;

    [haty,hatxp] = road_observer(A3,B3,C33,D3,L333,inSector3(:,t),xt_hat_333(:,t),yt_33(:,t));    
    yt_hat_333(:,t) = haty;
    xt_hat_333(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A3,B3,C34,D3,L343,inSector3(:,t),xt_hat_343(:,t),yt_34(:,t));    
    yt_hat_343(:,t) = haty;
    xt_hat_343(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A3,B3,C35,D3,L353,inSector3(:,t),xt_hat_353(:,t),yt_35(:,t));    
    yt_hat_353(:,t) = haty;
    xt_hat_353(:,t+1) = hatxp;
    
    [haty,hatxp] = road_observer(A4,B4,C44,D4,L444,inSector4(:,t),xt_hat_444(:,t),yt_44(:,t));    
    yt_hat_444(:,t) = haty;
    xt_hat_444(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A4,B4,C45,D4,L454,inSector4(:,t),xt_hat_454(:,t),yt_45(:,t));    
    yt_hat_454(:,t) = haty;
    xt_hat_454(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A4,B4,C46,D4,L464,inSector4(:,t),xt_hat_464(:,t),yt_46(:,t));    
    yt_hat_464(:,t) = haty;
    xt_hat_464(:,t+1) = hatxp;

    [haty,hatxp] = road_observer(A5,B5,C55,D5,L555,inSector5(:,t),xt_hat_555(:,t),yt_55(:,t));    
    yt_hat_555(:,t) = haty;
    xt_hat_555(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A5,B5,C56,D5,L565,inSector5(:,t),xt_hat_565(:,t),yt_56(:,t));    
    yt_hat_565(:,t) = haty;
    xt_hat_565(:,t+1) = hatxp;
    [haty,hatxp] = road_observer(A5,B5,C57,D5,L515,inSector5(:,t),xt_hat_515(:,t),yt_51(:,t));    
    yt_hat_515(:,t) = haty;
    xt_hat_515(:,t+1) = hatxp;  

    ey_t111(:,t) = abs(yn_1(:,t)-yt_hat_111(:,t));
    ey_t121(:,t) = abs(yn_1(:,t)-yt_hat_121(:,t));
    ey_t131(:,t) = abs(yn_1(:,t)-yt_hat_131(:,t));
    
    ey_t222(:,t) = abs(yn_2(:,t)-yt_hat_222(:,t));
    ey_t232(:,t) = abs(yn_2(:,t)-yt_hat_232(:,t));
    ey_t242(:,t) = abs(yn_2(:,t)-yt_hat_242(:,t));

    ey_t333(:,t) = abs(yn_3(:,t)-yt_hat_333(:,t));
    ey_t343(:,t) = abs(yn_3(:,t)-yt_hat_343(:,t));
    ey_t353(:,t) = abs(yn_3(:,t)-yt_hat_353(:,t));

    ey_t444(:,t) = abs(yn_4(:,t)-yt_hat_444(:,t));
    ey_t454(:,t) = abs(yn_4(:,t)-yt_hat_454(:,t));
    ey_t464(:,t) = abs(yn_4(:,t)-yt_hat_464(:,t));

    ey_t515(:,t) = abs(yn_5(:,t)-yt_hat_515(:,t));
    ey_t555(:,t) = abs(yn_5(:,t)-yt_hat_555(:,t));
    ey_t565(:,t) = abs(yn_5(:,t)-yt_hat_565(:,t));

%% Recovery gestione 
        
     

  %% stima  
%   activies{1}

    v1 = out_estim([xt_hat_111(:,t),xt_hat_121(:,t),xt_hat_131(:,t)],[tau{1,1}(t),tau{1,2}(t),tau{1,3}(t)],1,[yt_11(:,t),yt_12(:,t),yt_13(:,t)],[ey_t111(:,t),ey_t121(:,t),ey_t131(:,t)]);
    v2 = out_estim([xt_hat_222(:,t),xt_hat_232(:,t),xt_hat_242(:,t)],[tau{2,1}(t),tau{2,2}(t),tau{2,3}(t)],2,[yt_22(:,t),yt_23(:,t),yt_24(:,t)],[ey_t222(:,t),ey_t232(:,t),ey_t242(:,t)]);
    v3 = out_estim([xt_hat_333(:,t),xt_hat_343(:,t),xt_hat_353(:,t)],[tau{3,1}(t),tau{3,2}(t),tau{3,3}(t)],3,[yt_33(:,t),yt_34(:,t),yt_35(:,t)],[ey_t333(:,t),ey_t343(:,t),ey_t353(:,t)]);
    v4 = out_estim([xt_hat_444(:,t),xt_hat_454(:,t),xt_hat_464(:,t)],[tau{4,1}(t),tau{4,2}(t),tau{4,3}(t)],4,[yt_44(:,t),yt_45(:,t),yt_46(:,t)],[ey_t444(:,t),ey_t454(:,t),ey_t464(:,t)]);
    v5 = out_estim([xt_hat_515(:,t),xt_hat_555(:,t),xt_hat_565(:,t)],[tau{5,1}(t),tau{5,2}(t),tau{5,3}(t)],5,[yt_51(:,t),yt_55(:,t),yt_56(:,t)],[ey_t515(:,t),ey_t555(:,t),ey_t565(:,t)]);   

    xt_hat_1(:,t) = v1(1:4);
    xt_hat_2(:,t) = v2(1:7);
    xt_hat_3(:,t) = v3(1:5);
    xt_hat_4(:,t) = v4(1:5);
    xt_hat_5(:,t) = v5(1:4);

    yt_1(:,t) = v1(5:8);
    yt_2(:,t) = v2(8:14);
    yt_3(:,t) = v3(6:10);
    yt_4(:,t) = v4(6:10);
    yt_5(:,t) = v5(5:8);

    eyt_1(:,t) = sum(v1(9:12));
    eyt_2(:,t) = sum(v2(15:21));
    eyt_3(:,t) = sum(v3(11:15));
    eyt_4(:,t) = sum(v4(11:15));
    eyt_5(:,t) = sum(v5(9:12));


    
    
    
 
  %% performance 
   

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % CALCOLO PERFORMNCE INDEX
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    inst_cons_S1(1,t) = polesS1/4*kW*dimming((yt_1(1,t)))/100;
    inst_cons_S1(2,t) = polesS1/4*kW*dimming((yt_1(2,t)))/100;
    inst_cons_S1(3,t) = polesS1/4*kW*dimming((yt_1(3,t)))/100;
    inst_cons_S1(4,t) = polesS1/4*kW*dimming((yt_1(4,t)))/100;
    inst_cons_S2(1,t) = polesS2/7*kW*dimming((yt_2(1,t)))/100;
    inst_cons_S2(2,t) = polesS2/7*kW*dimming((yt_2(2,t)))/100;
    inst_cons_S2(3,t) = polesS2/7*kW*dimming((yt_2(3,t)))/100;
    inst_cons_S2(4,t) = polesS2/7*kW*dimming((yt_2(4,t)))/100;
    inst_cons_S2(5,t) = polesS2/7*kW*dimming((yt_2(5,t)))/100;
    inst_cons_S2(6,t) = polesS2/7*kW*dimming((yt_2(6,t)))/100;
    inst_cons_S2(7,t) = polesS2/7*kW*dimming((yt_2(7,t)))/100;
    inst_cons_S3(1,t) = polesS3/5*kW*dimming((yt_3(1,t)))/100;
    inst_cons_S3(2,t) = polesS3/5*kW*dimming((yt_3(2,t)))/100;
    inst_cons_S3(3,t) = polesS3/5*kW*dimming((yt_3(3,t)))/100;
    inst_cons_S3(4,t) = polesS3/5*kW*dimming((yt_3(4,t)))/100;
    inst_cons_S3(5,t) = polesS3/5*kW*dimming((yt_3(5,t)))/100;
    inst_cons_S4(1,t) = polesS4/5*kW*dimming((yt_4(1,t)))/100;
    inst_cons_S4(2,t) = polesS4/5*kW*dimming((yt_4(2,t)))/100;
    inst_cons_S4(3,t) = polesS4/5*kW*dimming((yt_4(3,t)))/100;
    inst_cons_S4(4,t) = polesS4/5*kW*dimming((yt_4(4,t)))/100;
    inst_cons_S4(5,t) = polesS4/5*kW*dimming((yt_4(5,t)))/100;
    inst_cons_S5(1,t) = polesS5/4*kW*dimming((yt_5(1,t)))/100;
    inst_cons_S5(2,t) = polesS5/4*kW*dimming((yt_5(2,t)))/100;
    inst_cons_S5(3,t) = polesS5/4*kW*dimming((yt_5(3,t)))/100;
    inst_cons_S5(4,t) = polesS5/4*kW*dimming((yt_5(4,t)))/100;


    I1(:,t) = dimming(eyt_1(:,t));
    I2(:,t) = dimming(eyt_2(:,t));
    I3(:,t) = dimming(eyt_3(:,t));
    I4(:,t) = dimming(eyt_4(:,t));
    I5(:,t) = dimming(eyt_5(:,t));

    J1(:,t) = indice_di_costo(I1(:,t),Jmax(1,t),25,1);
    J2(:,t) = indice_di_costo(I2(:,t),Jmax(2,t),25,1);
    J3(:,t) = indice_di_costo(I3(:,t),Jmax(3,t),25,1);
    J4(:,t) = indice_di_costo(I4(:,t),Jmax(4,t),25,1);
    J5(:,t) = indice_di_costo(I5(:,t),Jmax(5,t),25,1);
    Jmax(1,t+1) = J1(:,t);
    Jmax(2,t+1) = J2(:,t);
    Jmax(3,t+1) = J3(:,t);
    Jmax(4,t+1) = J4(:,t);
    Jmax(5,t+1) = J5(:,t);
    Js{1}(t) = J1(:,t)/100;
    Js{2}(t) = J2(:,t)/100;
    Js{3}(t) = J3(:,t)/100;
    Js{4}(t) = J4(:,t)/100;
    Js{5}(t) = J5(:,t)/100;


   
%% trust according to sensor perspectives
    Ts=1;
    
    if t<=time_off||mod(t,Ts)~=0
        stati_1=stati;
        tau_s{1}=[tau{1,1}(t);tau{5,1}(t)]; 
        tau_s{2}=[tau{1,2}(t);tau{2,1}(t)];
        tau_s{3}=[tau{1,3}(t);tau{2,2}(t);tau{3,1}(t)];
        tau_s{4}=[tau{2,3}(t);tau{3,2}(t);tau{4,1}(t)];
        tau_s{5}=[tau{3,3}(t);tau{4,2}(t);tau{5,2}(t)];
        tau_s{6}=[tau{4,3}(t);tau{5,3}(t)];

        for i=1:5
          for j=1:3
             tau{i,j}(t+1)=tau{i,j}(t);
          end
        end

    else    
        stati_1=stati;
        tau_s{1}=[tau{1,1}(t);tau{5,1}(t)]; 
        tau_s{2}=[tau{1,2}(t);tau{2,1}(t)];
        tau_s{3}=[tau{1,3}(t);tau{2,2}(t);tau{3,1}(t)];
        tau_s{4}=[tau{2,3}(t);tau{3,2}(t);tau{4,1}(t)];
        tau_s{5}=[tau{3,3}(t);tau{4,2}(t);tau{5,2}(t)];
        tau_s{6}=[tau{4,3}(t);tau{5,3}(t)];
        
        for id=1:5
            trust_automata(alphas,betas,gs,Js,tau_s,tau_s_1,id,t,Ws,Ts);
        end 
  
    end
    
    tau_s_1=tau_s;
    
%     %reset mechanism

%     if mod(t,50)==0
%             disp('resetting')
%     tau_11(t+1) = .5; 
%     tau_12(t+1) = .5;
%     tau_21(t+1) = .5;
%     tau_22(t+1) = .5;
%     end
     


    t
end

%
grafici

%% CALCOLO CONSUMI
% Standard: Consumo 100Wh*100
% LED non dimmerato: Consumo 50Wh*100
%
poles=polesS1+polesS2+polesS3+polesS4+polesS5;
min = Toss/60;
rapporto = min/60;
std = poles*100*1.2*rapporto; %1.2 rappresenta potenziali inefficienze dovuto a usura reattori ecc.
led = poles*kW*1.2*rapporto; %1.2 rappresenta eventuali aumenti dovuti al fatto che gli input non sono realistici 
smart1 = mean(sum(inst_cons_S1))*rapporto;
smart2 = mean(sum(inst_cons_S2))*rapporto;
smart3 = mean(sum(inst_cons_S3))*rapporto;
smart4 = mean(sum(inst_cons_S4))*rapporto;
smart5 = mean(sum(inst_cons_S5))*rapporto;

disp('Street Consumption kWh')
std = (std)/1000
led = (led)/1000
smart = (smart1 + smart2 + smart3 + smart4 + smart5)/1000
disp('Energy saving %')
ledVSstd = (1-(led/std))*100
smartVSstd = (1-(smart/std))*100
smartVSled = (1-(smart/led))*100