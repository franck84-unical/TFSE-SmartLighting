
%% Plant 1
a_0i = 0.1;
rn1 = 4;
c = [3 1 2 4]; % road weights
    %1 2 8 9
P = [1 1 1 1]; % external world
G = [0 1 1 1;
     1 0 1 1;
     1 1 0 1;
     1 1 1 0];
[n,m] = size(G);
A = zeros(n,m);
for i = 1 : n
    somma = 0;
    for j = 1 : m
        if i ~= j
            if G(i,j)==1 && P(i) == 0 % la strada NON è connessa con "external world"    
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + c(i));
            elseif G(i,j)==1 && P(i) == 1 % la strada è connessa con "external world"
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + 2*c(i));
            else
                A(j,i) = 0;
            end
            somma = somma + A(j,i);
        end
    end
    A(i,i) = 1 - (a_0i + somma);
end
A1 = A;
B1 = eye(4);
C1 = eye(4);
D1 = zeros(4);


%% Plant 2
a_0i = 0.1;
rn2 = 7;

c = [2 2 3 4 1 4 2]; % road weights
    %3 4 5 6 7 9 11
P = [1 1 1 1 1 1 1]; % external world
G = [0 0 0 0 0 1 0;%3
     0 0 0 0 0 1 0;%4
     0 0 0 1 1 1 0;%5
     0 0 1 0 1 1 1;%6
     0 0 1 1 0 1 0;%7
     1 1 1 1 1 0 0;%9
     0 0 0 1 0 0 0;%11
     ];
[n,m] = size(G);
A = zeros(n,m);
for i = 1 : n
    somma = 0;
    for j = 1 : m
        if i ~= j
            if G(i,j)==1 && P(i) == 0 % la strada NON è connessa con "external world"    
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + c(i));
            elseif G(i,j)==1 && P(i) == 1 % la strada è connessa con "external world"
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + 2*c(i));
            else
                A(j,i) = 0;
            end
            somma = somma + A(j,i);
        end
    end
    A(i,i) = 1 - (a_0i + somma);
end
A2 = A;
B2 = eye(rn2);
C2 = eye(rn2);
D2 = zeros(rn2);


%% Plant 3
a_0i = 0.1;
rn3 = 5;

c = [4 6  2  2  2]; % road weights
    %6 10 12 13 14
P = [1 1  1  1  1]; % external world
G = [0 1  1  1  1 ;%6
     1 0  0  0  1;%10
     1 0  0  0  0 ;%12
     1 0  0  0  0;%13
     1 1  0  0  0;%14
     ];
[n,m] = size(G);
A = zeros(n,m);
for i = 1 : n
    somma = 0;
    for j = 1 : m
        if i ~= j
            if G(i,j)==1 && P(i) == 0 % la strada NON è connessa con "external world"    
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + c(i));
            elseif G(i,j)==1 && P(i) == 1 % la strada è connessa con "external world"
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + 2*c(i));
            else
                A(j,i) = 0;
            end
            somma = somma + A(j,i);
        end
    end
    A(i,i) = 1 - (a_0i + somma);
end
A3 = A;
B3 = eye(rn3);
C3 = eye(rn3);
D3 = zeros(rn3);

%% Plant 4
a_0i = 0.1;
rn4 = 5;

c = [6  2  2  2  1]; % road weights
    %10 15 16 17 18
P = [1 1  1  1  1]; % external world
G = [0 1  1  1  1 ;%10
     1 0  0  0  0;%15
     1 0  0  0  0 ;%16
     1 0  0  0  0;%17
     1 0  0  0  0;%18
     ];
[n,m] = size(G);
A = zeros(n,m);
for i = 1 : n
    somma = 0;
    for j = 1 : m
        if i ~= j
            if G(i,j)==1 && P(i) == 0 % la strada NON è connessa con "external world"    
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + c(i));
            elseif G(i,j)==1 && P(i) == 1 % la strada è connessa con "external world"
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + 2*c(i));
            else
                A(j,i) = 0;
            end
            somma = somma + A(j,i);
        end
    end
    A(i,i) = 1 - (a_0i + somma);
end
A4 = A;
B4 = eye(rn4);
C4 = eye(rn4);
D4 = zeros(rn4);

%% Plant 5
a_0i = 0.1;
rn5 = 4;

c = [6  2  2  2 ]; % road weights
    %10 19 20 21
P = [1  1  1  1]; % external world
G = [0 1  1  1;%10
     1 0  0  0;%19
     1 0  0  1;%20
     1 0  1  0;%21
     ];
[n,m] = size(G);
A = zeros(n,m);
for i = 1 : n
    somma = 0;
    for j = 1 : m
        if i ~= j
            if G(i,j)==1 && P(i) == 0 % la strada NON è connessa con "external world"    
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + c(i));
            elseif G(i,j)==1 && P(i) == 1 % la strada è connessa con "external world"
                sum_k = 0;
                for k = 1 : m
                     sum_k = sum_k + c(k)*G(i,k);
                end
                A(j,i) = c(j)/(sum_k + 2*c(i));
            else
                A(j,i) = 0;
            end
            somma = somma + A(j,i);
        end
    end
    A(i,i) = 1 - (a_0i + somma);
end
A5 = A;
B5 = eye(rn5);
C5 = eye(rn5);
D5 = zeros(rn5);
