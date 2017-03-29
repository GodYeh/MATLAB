function [Deg_Output,F_Output] = DataRange(state, n, Deg_Input, F_Input)

Deg_P = [];
Deg_PP = [];
a = 0;
b = 0;

%% ��X��l�ƾڻݭn���R���϶�
switch state
    case 'DOWN'
        Deg_P = find (Deg_Input > 0.5 & Deg_Input < 169.5); % ��X�϶���index��
        a = Deg_P(1);
        Deg_PP = diff(Deg_P);
        b = Deg_P(find(Deg_PP ~= 1)); % ���index���s�򪺦a��A�Y���W�H�Ω��U����ɳB
        b = [a;b(1:end)];
        
        % n���ݧڲ{�b�n�쪺�u�q�O�ĴX�ӽu�q
        Deg_Output = Deg_Input(b(2*n-1):b(2*n));
        F_Output = F_Input(b(2*n-1):b(2*n));
        
    case 'UP'
        Deg_P = find (Deg_Input > 0.5 & Deg_Input < 169.5); % ��X�϶���index��
        Deg_PP = diff(Deg_P);
        b = Deg_P(find(Deg_PP ~= 1)+1); % ���index���s�򪺦a��A�Y���W�H�Ω��U����ɳB
        b = [b(1:end);Deg_P(end)];

        Deg_Output = Deg_Input(b(2*n-1):b(2*n));
        F_Output = F_Input(b(2*n-1):b(2*n));
end
