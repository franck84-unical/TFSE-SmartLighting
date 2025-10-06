function  trust_automata(alphas,betas,gs,Jt,tau_s,tau_s_1,id,t,Ws,Ts)

%% Descrizione
% Questa funzione blabla

%% Sintassi
% [m,t]=trust_input()
%% Input

%% Output


J=Jt{id}(t);
J_1=Jt{id}(t-Ts);

% i sensori sono mappati con numeri interi a partire da 1 per ogni agente,
% mettendo prima i sensori locali
% HOME=0, PERTURBA=1, OSSERVA=2
global stati H_bad activies %\tilde{\Xi}
global L_out R_in l_out tau repaired ee eps

% bhorizon=20;
% if t<=bhorizon||ismember(t,reset_t)==1
% eps=0.001;
% Jmin(id,1:t)=eps;
% else
%     Jmin(id,t)=Jt(t);
%     eps=min(Jmin(id,t-bhorizon:t));
% end
%eps=min(min([J1,J2,J3,J4,J5]),0.1);
%eps=min([J1,J2,J3,J4,J5]);
%th=max(tau);
th=0.2;
J_max=1;

modificato = false;



%end
while(modificato==false)
switch stati(id)
    case 0 %HOME
        if ~isempty(R_in{id}) % some sensors have been repaired
            activies{id}=[activies{id},R_in{id}];
            tau{id,R_in{id}}(t)=1;
            R_in{id}=[];
        end
        if J<eps
            for h=1:3
                [i,j] = sensor_map(id,h);
                ONE=ones(length(Ws{i}),1);
                ONE(j)=0;
                tau{id,h}(t+1) = trust_calc(tau{id,h}(t),alphas(id,h),betas(id,h),gs(id,h),ONE'*tau_s{i},0); 
                modificato=true;
                
            end
            stati(id)=0;
            return
        else
            H_bad{id}=activies{id};
            stati(id)=2;
        end


    case 1 %OBSERVE
        if (J>=J_1) && l_out(id)>0
            R_in{id}=[R_in{id},l_out(id)];
            l_out(id)=0;
        else
            l_out(id)=0;
        end
        if ~isempty(repaired{id})
            R_in{id}=[R_in{id},repaired{id}];
            stati(id)=2;
        end
        for h=activies{id}

            if tau{id,h}(t)<th
                L_out{id}=[L_out{id},h];
                %inactivies{id}(h)=min(inactivies{id}(h),t);
                %activies{id}=setdiff(activies{id},h);
                %stati(id)=0;
            end

        end
        if (J>=J_1)
            for h=H_bad{id}
                [i,j] = sensor_map(id,h);
                ONE=ones(length(Ws{i}),1);
                ONE(j)=0;
                tau_tilde = tau_s{i};
                tau_tilde(j)=tau_tilde(j)-tau{id,h}(t)+alphas(id,h)*tau{id,h}(t-1)+ee*betas(id,h)*ONE'*tau_s_1{i};
                if Ws{i}*tau_tilde >= Ws{i}*tau_s_1{i}
                    H_bad{id}=setdiff(H_bad{id},h);
                end
            end
            if isempty(H_bad{id})
                H_bad{id}=activies{id};
            end
            stati(id)=2;
        else
            if (J<eps)
                stati(id)=0;
            else
                stati(id)=2;
            end
        end

    case 2 %PERTRUB
        if ~isempty(R_in{id})
            for h=R_in{id}
                activies{id}=[activies{id},h];
                tau{id,h}(t)=1;
                R_in{id}=[];
            end
            for h=activies{id}
                [i,j] = sensor_map(id,h);
                ONE=ones(length(Ws{i}),1);
                ONE(j)=0;
                u=(1/gs(id,h))*(1-alphas(id,h)*tau{id,h}(t)-ee*betas(id,h)*ONE'*tau_s{i});
                tau{id,h}(t+1)=trust_calc(tau{id,h}(t),alphas(id,h),betas(id,h),gs(id,h),ONE'*tau_s{i},u);
            end
            for h=setdiff(1:3,activies{id})
                 [i,j] = sensor_map(id,h);
                ONE=ones(length(Ws{i}),1);
                ONE(j)=0;
                u=0;
                tau{id,h}(t+1)=trust_calc(tau{id,h}(t),alphas(id,h),betas(id,h),gs(id,h),ONE'*tau_s{i},u);
            end
            stati(id)=1;
            modificato=true;
        end
        if ~isempty(L_out{id})&& length(activies{id})>1 
            activies{id}=setdiff(activies{id},L_out{id}(end));
            H_bad{id}=setdiff(H_bad{id},L_out{id}(end));

            for h=activies{id}
                [i,j] = sensor_map(id,h);
                ONE=ones(length(Ws{i}),1);
                ONE(j)=0;
                u=(1/gs(id,h))*(tau{id,h}(t)-alphas(id,h)*tau{id,h}(t)-ee*betas(id,h)*ONE'*tau_s{i});
                tau{id,h}(t+1)=trust_calc(tau{id,h}(t),alphas(id,h),betas(id,h),gs(id,h),ONE'*tau_s{i},u);
            end
            for h=setdiff(1:3,activies{id})
                tau{id,h}(t+1)=0;
                
                %[i,j] = sensor_map(id,h);
                %ONE=ones(2,1);
                %ONE(j)=0;
                %u=0;
                %tau{id,h}(t+1)=trust_calc(tau{id,h}(t),alphas(id,h),betas(id,h),gs(id,h),ONE'*tau_s{i},u);
            end
            stati(id)=1;
            tau{id,L_out{id}(end)}(t+1)=0;
            l_out(id) = L_out{id}(end);
            L_out{id}(end)=[];
            modificato=true;
            

            return
        end

        for h=H_bad{id}
            [i,j] = sensor_map(id,h);
            ONE=ones(length(Ws{i}),1);
            ONE(j)=0;
            u=(1/gs(id,h))*(-ee*betas(id,h)*ONE'*tau_s{i})-tau{id,h}(t)*J;
            tau{id,h}(t+1)=trust_calc(tau{id,h}(t),alphas(id,h),betas(id,h),gs(id,h),ONE'*tau_s{i},u);
        end
        for h=setdiff(1:3,H_bad{id})
            %tau{id,h}(t+1)=0;
            [i,j] = sensor_map(id,h);
            ONE=ones(length(Ws{i}),1);
            ONE(j)=0;
            u=0;
            tau{id,h}(t+1)=trust_calc(tau{id,h}(t),alphas(id,h),betas(id,h),gs(id,h),ONE'*tau_s{i},u);
        end
        stati(id)=1;
        modificato=true;
end
end


end
function [out] = trust_calc(tau,a,b,g,summit,u)
global ee
%lambda=0.8;
%eyt=eyt;
%     x = b*summit-(tau/sum(tau_l))*eyt+log(1/2)/log(lambda);
%     x_2 = b*summit+log(1/2)/log(lambda);
%
%     if active==1
%    out = a*tau+b*summit*sca(x)+g*(2*lambda^((tau/sum(tau_l))*eyt)-1)*(1-sca(-x));
%     else
%     out = a*tau+b*summit*sca(x_2)+0.45*g*(1-sca(-x_2));
%     %out = tau;
%     end


out = min(1,max(0.001,a*tau+ee*b*summit+g*u));
%      if token==2
%          active
%          x
%          x_2
%          out
%          pause
%      end

end
