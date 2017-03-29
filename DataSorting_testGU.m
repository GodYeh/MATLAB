clear all;
clc;

filename = '0329';
sheetnum = 1;
% T = xlsread(filename,sheetnum,'A:A10000');
Deg = xlsread(filename,sheetnum,'C:C');
F = xlsread(filename,sheetnum,'D:D');

[Deg,F] = DataRange('DOWN', 2, Deg, F);

Deg_temp = Deg; % 角度佔存
Deg_temp(find(Deg==0)) = [];
F_Output = zeros([100,1]);
Deg = zeros([100,1]); % 最終整理完畢的角度

temp_end = 0;
temp_start = 1;
i = 1; % Deg_temp 的 count
j = 1; % 最終輸出的 count

Deg_temp = fix(Deg_temp*10);
state = 'DOWN';
%% 判斷原始資料點的情況是屬於哪種情況

switch state
    case 'UP'
        Deg_last = 1700;
        Deg_now = 1700;
        Deg_next = 1699;
    case 'DOWN'
        Deg_last = 0;
        Deg_now = 0;
        Deg_next = 1;
end

switch state
    case 'DOWN'
%% 判斷原始資料點的情況是屬於哪種情況
        while Deg_now < 1690 % actual degree * 10
            if Deg_temp(i) == Deg_now
                if Deg_now == 0
                    Deg_state = 'first'
                else
                    Deg_state = 'now';
                end
            elseif Deg_temp(i) >= Deg_next
                if Deg_now == 0
                    Deg_state = 'first';
                else
                    Deg_state = 'next';
                end
            elseif Deg_temp(i) < Deg_now
                Deg_state = 'clear';
            else
                Deg_state = 'error';
            end
            %% 依據不同的state去處理數據
            switch Deg_state 
                case 'now'
                    temp_start = i;
                    temp_end = i;
                    while Deg_temp(i+1) == Deg_now
                        temp_end = i+1;
                        i = i + 1;
                    end
                    Deg(j) = Deg_now;
                    F_Output(j) = sum(F(temp_start:temp_end))/(temp_end-temp_start+1);
                    j = j + 1;
                    i = i + 1;
                    Deg_last = Deg_now;
                    Deg_now = Deg_now + 1; % 往下一個數字繼續計算   
                    Deg_next = Deg_now + 1;

                case 'next'
                    Deg(j) = Deg_now;
                    F_Output(j) = F_Output(j-1);
                    j = j + 1; 
                    Deg_last = Deg_now;
                    Deg_now = Deg_now + 1; % 往下一個數字繼續計算   
                    Deg_next = Deg_now + 1;
                case 'first'
                    Deg(j) = Deg_now;
                    F_Output(j) = 0;
                    while Deg_temp(i+1) == Deg_now
                        i = i + 1;
                    end
                    j = j + 1; 
                    i = i + 1;
                    Deg_last = Deg_now;
                    Deg_now = Deg_now + 1; % 往下一個數字繼續計算   
                    Deg_next = Deg_now + 1;
                case 'clear'
                    i = i + 1;
                case 'error'
                    break;

        %         otherwise
        %             Deg(j) = Deg_now;
        %             F_Output(j) = 123;
        %             j = j + 1;
        %             i = i + 1;
        %             Deg_now = Deg_now + 0.1; % 往下一個數字繼續計算        
            end
        end
    case 'UP'
        %% 判斷原始資料點的情況是屬於哪種情況
        while Deg_now > 15 % actual degree * 10
            if Deg_temp(i) == Deg_now
                if Deg_now == 1700 || Deg_temp(i)>1700
                    Deg_state = 'first';
                else
                    Deg_state = 'now';
                end
            elseif Deg_temp(i) <= Deg_next
                if Deg_now == 1700 || Deg_temp(i)>1700
                    Deg_state = 'first';
                else
                    Deg_state = 'next';
                end
            else
                Deg_state = 'error';
            end

            %% 依據不同的state去處理數據
            switch Deg_state 
                case 'now'
                    temp_start = i;
                    temp_end = i;
                    while Deg_temp(i+1) == Deg_now
                        temp_end = i+1;
                        i = i + 1;
                    end
                    Deg(j) = Deg_now;
                    F_Output(j) = sum(F(temp_start:temp_end))/(temp_end-temp_start+1);
                    j = j + 1;
                    i = i + 1;
                    Deg_last = Deg_now;
                    Deg_now = Deg_now - 1; % 往下一個數字繼續計算   
                    Deg_next = Deg_now - 1;

                case 'next'
                    Deg(j) = Deg_now;
                    F_Output(j) = F_Output(j-1);
                    j = j + 1; 
                    Deg_last = Deg_now;
                    Deg_now = Deg_now - 1; % 往下一個數字繼續計算   
                    Deg_next = Deg_now - 1;
                case 'first'
                    Deg(j) = Deg_now;
                    F_Output(j) = 0;
                    while Deg_temp(i+1) == Deg_now
                        i = i + 1;
                    end
                    j = j + 1; 
                    i = i + 1;
                    Deg_last = Deg_now;
                    Deg_now = Deg_now - 1; % 往下一個數字繼續計算   
                    Deg_next = Deg_now - 1;
                case 'error'
                    break;

        %         otherwise
        %             Deg(j) = Deg_now;
        %             F_Output(j) = 123;
        %             j = j + 1;
        %             i = i + 1;
        %             Deg_now = Deg_now + 0.1; % 往下一個數字繼續計算        
            end
        end
        
end

Deg = Deg/10;
