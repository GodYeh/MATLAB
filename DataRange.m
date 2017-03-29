function [Deg_Output,F_Output] = DataRange(state, n, Deg_Input, F_Input)

Deg_P = [];
Deg_PP = [];
a = 0;
b = 0;

%% 找出原始數據需要分析的區間
switch state
    case 'DOWN'
        Deg_P = find (Deg_Input > 0.5 & Deg_Input < 169.5); % 找出區間的index值
        a = Deg_P(1);
        Deg_PP = diff(Deg_P);
        b = Deg_P(find(Deg_PP ~= 1)); % 找到index不連續的地方，即往上以及往下的交界處
        b = [a;b(1:end)];
        
        % n為看我現在要抓的線段是第幾個線段
        Deg_Output = Deg_Input(b(2*n-1):b(2*n));
        F_Output = F_Input(b(2*n-1):b(2*n));
        
    case 'UP'
        Deg_P = find (Deg_Input > 0.5 & Deg_Input < 169.5); % 找出區間的index值
        Deg_PP = diff(Deg_P);
        b = Deg_P(find(Deg_PP ~= 1)+1); % 找到index不連續的地方，即往上以及往下的交界處
        b = [b(1:end);Deg_P(end)];

        Deg_Output = Deg_Input(b(2*n-1):b(2*n));
        F_Output = F_Input(b(2*n-1):b(2*n));
end
