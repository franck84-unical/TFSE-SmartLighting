function [y1,y2,y3,xp] = road_model(A,B,C1,C2,C3,D,E,F,u,x,d,f1,f2,f3)
    xp = A*x + B*u + E*d;
    y1  = C1*x + D*u + F*f1;
    y2  = C2*x + D*u + F*f2;
    y3  = C3*x + D*u + F*f3;
end

