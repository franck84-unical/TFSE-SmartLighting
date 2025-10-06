function [haty,hatxp] = road_observer(A,B,C,D,L,u,hatx,y)
    haty = C*hatx + D*u;
    hatxp = A*hatx + B*u + L*(y-haty); 
end

