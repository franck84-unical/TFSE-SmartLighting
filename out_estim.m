function out  = out_estim(x_s,tau_s,id,y_s,f_s)
global activies L111

den = max(0.001,sum(tau_s(activies{1})));
if den == 0
 disp(den)
end
x = (1/den)*(sum(x_s(:,activies{id}).*tau_s(activies{id}),2));
y = (1/den)*(sum(y_s(:,activies{id}).*tau_s(activies{id}),2));
e = (1/den)*(sum(f_s(:,activies{id}).*tau_s(activies{id}),2));


    
out = [x;y;e];

end
