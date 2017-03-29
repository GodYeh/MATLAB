clear all;
clc;

filename = 'Golden_sample';
sheetnum = 1;
T = xlsread(filename,sheetnum,'A1:A10000');
Vel = xlsread(filename,sheetnum,'B1:B10000');
Deg = xlsread(filename,sheetnum,'C1:C10000');
F1 = xlsread(filename,sheetnum,'D1:D10000');
F2= xlsread(filename,sheetnum,'E1:E10000');

Deg_P = [];
Deg_PP = [];
a = 0;
b = 0;
state = 'UP';
%% 找出原始數據需要分析的區間
switch state
    case 'DOWN'
        Deg_P = find (Deg > 0.5 & Deg < 160); % 找出區間的index值
        a = Deg_P(1);
        Deg_PP = diff(Deg_P);
        b = Deg_P(find(Deg_PP ~= 1)); % 找到index不連續的地方，即往上以及往下的交界處
        b = [a;b(1:end)];
        n=2;
        Deg_Output = Deg(b(2*n-1):b(2*n));
        F_Output = F2(b(2*n-1):b(2*n));
        
%         Deg_Output1 = Deg(b(1):b(2));
%         Deg_Output2 = Deg(b(3):b(4));
%         F_Output1 = F1(b(1):b(2));
%         F_Output2 = F1(b(3):b(4));
    case 'UP'
        Deg_P = find (Deg > 0.5 & Deg < 160); % 找出區間的index值
        Deg_PP = diff(Deg_P);
        b = Deg_P(find(Deg_PP ~= 1)+1); % 找到index不連續的地方，即往上以及往下的交界處
        b = [b(1:end);Deg_P(end)];
        n=2;
        Deg_Output = Deg(b(2*n-1):b(2*n));
        F_Output = F1(b(2*n-1):b(2*n));

end

plot(Deg_Output, F_Output);

% 2*n - 1
