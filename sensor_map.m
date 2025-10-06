function [i,j]=sensor_map(id,h)

% mappa che da id agente e posizione sensore (1:3) stabilisce l'indice j nel
% vettore tau del sensore i

switch id
    case 1
        switch h
            case 1
                i=1;
                j=1;
            case 2
                i = 2;
                j = 1;
            case 3
                i =3;
                j =1;
        end
    case 2
        switch h
            case 1
                i=2;
                j=2;
            case 2
                i = 3;
                j = 2;
            case 3
                i =4;
                j =1;
        end

    case 3
        switch h
            case 1
                i=3;
                j=3;
            case 2
                i = 4;
                j = 2;
            case 3
                i =5;
                j =1;
        end

    case 4
        switch h
            case 1
                i=4;
                j=3;
            case 2
                i = 5;
                j = 2;
            case 3
                i =6;
                j =1;
        end


    case 5
        switch h
            case 1
                i=1;
                j=2;
            case 2
                i = 5;
                j = 3;
            case 3
                i =6;
                j =2;
        end
end