function [T_1,T_2,T_3,T_4,T_5,Vel_1,Vel_2,Vel_3,Vel_4,Vel_5,Deg_1,Deg_2,Deg_3,Deg_4,Deg_5,F1_1,F1_2,F1_3,F1_4,F1_5,F2_1,F2_2,F2_3,F2_4,F2_5] = SubLoad(filename)

filename = '0324_test'

T = zeros(10000,1);
T_1 = xlsread(filename,1,'A1:A10000');
% T_2 = xlsread(filename,2,'A1:A10000');
% T_3 = xlsread(filename,3,'A1:A10000');
% T_4 = xlsread(filename,4,'A1:A10000');
% T_5 = xlsread(filename,5,'A1:A10000');


Vel_1 = xlsread(filename,1,'B1:B10000');
% Vel_2 = xlsread(filename,2,'B1:B10000');
% Vel_3 = xlsread(filename,3,'B1:B10000');
% Vel_4 = xlsread(filename,4,'B1:B10000');
% Vel_5 = xlsread(filename,5,'B1:B10000');

Deg_1 = xlsread(filename,1,'C1:C10000');
% Deg_2 = xlsread(filename,2,'C1:C10000');
% Deg_3 = xlsread(filename,3,'C1:C10000');
% Deg_4 = xlsread(filename,4,'C1:C10000');
% Deg_5 = xlsread(filename,5,'C1:C10000');

F1_1 = xlsread(filename,1,'D1:D10000');
% F1_2 = xlsread(filename,2,'D1:D10000');
% F1_3 = xlsread(filename,3,'D1:D10000');
% F1_4 = xlsread(filename,4,'D1:D10000');
% F1_5 = xlsread(filename,5,'D1:D10000');

F2_1= xlsread(filename,1,'E1:E10000');
% F2_2= xlsread(filename,2,'E1:E10000');
% F2_3= xlsread(filename,3,'E1:E10000');
% F2_4= xlsread(filename,4,'E1:E10000');
% F2_5= xlsread(filename,5,'E1:E10000');

% 若mini大於零就不用加
if min(F1_1) < 0
    F1_1 = F1_1 + abs(min(F1_1));
else
end
if min(F1_2) < 0
    F1_2 = F1_2 + abs(min(F1_2));
else
end
if min(F1_3) < 0
    F1_3 = F1_3 + abs(min(F1_3));
else
end
if min(F1_4) < 0
    F1_4 = F1_4 + abs(min(F1_4));
else
end
if min(F1_5) < 0
    F1_5 = F1_5 + abs(min(F1_5));
else
end


if min(F2_1) < 0
    F2_1 = F2_1 + abs(min(F2_1));
else
end
if min(F2_2) < 0
    F2_2 = F2_2 + abs(min(F2_2));
else
end
if min(F2_3) < 0
    F2_3 = F2_3 + abs(min(F2_3));
else
end
if min(F2_4) < 0
    F2_4 = F2_4 + abs(min(F2_4));
else
end
if min(F2_5) < 0
    F2_5 = F2_5 + abs(min(F2_5));
else
end

% F1_2 = F1_2 + abs(min(F1_2))
% F1_3 = F1_3 + abs(min(F1_3))
% 
% F2_1 = F2_1 + abs(min(F2_1))
% F2_2 = F2_2 + abs(min(F2_2))
% F2_3 = F2_3 + abs(min(F2_3))
% 
% 
