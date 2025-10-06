ray=1;
fault_fact=2;
a = ceil(Toss*5/16);
b = ceil(Toss*36/288);
c = ceil(0.75*Toss);
fault_1 = [zeros(1,a) linspace(0,ray*fault_fact,b) ray*fault_fact*ones(1,Toss-(a+b))];
fault_2 = ray*fault_fact*[zeros(1,ceil(Toss/4)) ones(1,ceil(Toss/4)) ones(1,ceil(Toss/4)) ones(1,floor(Toss/4))];
fault_3 = ray*fault_fact*[zeros(1,ceil(Toss/4)) ones(1,ceil(Toss/4)) zeros(1,ceil(Toss/4)) ones(1,floor(Toss/4))];
fault_4 = ray*fault_fact*[zeros(1,ceil(Toss/4)) ones(1,ceil(Toss/4)) ones(1,ceil(Toss/4)) ones(1,floor(Toss/4))];
fault_5 = ray*fault_fact*[zeros(1,ceil(Toss/4)) zeros(1,ceil(Toss/4)) zeros(1,ceil(Toss/4)) ones(1,floor(Toss/4))];%ray*fault_fact-fault_1;
fault_6 = ray*fault_fact*[ones(1,ceil(Toss/4)) zeros(1,ceil(Toss/4)) ones(1,ceil(Toss/4)) ones(1,floor(Toss/4))];
fault_7 = ray*fault_fact*[zeros(1,ceil(Toss/4)) ones(1,ceil(Toss/4)) ones(1,ceil(Toss/4)) ones(1,ceil(Toss/4))];


    %simNumber 1: 1-2-4-6
    %simNumber 2: tutti
    simNumber = 1;

    if simNumber == 1
        fault_1=5*fault_1*1;%20
        fault_2=5*fault_2*1;%10
        fault_3=5*fault_3*0;%5 modificare in modo che passi a zero e poi a 1
        fault_4=10*fault_4*1;%20
        fault_5=1*fault_5*0;
        fault_6=10*fault_6*1;
    else
        fault_1=5*fault_1*1;%20
        fault_2=5*fault_2*1;%10
        fault_3=5*fault_3*1;%5 modificare in modo che passi a zero e poi a 1
        fault_4=10*fault_4*1;%20
        fault_5=1*fault_5*1;
        fault_6=10*fault_6*1; 
    end