clear all;
clc;

%% excel讀取資料
filename = '123.xlsx';
T = xlsread(filename,6,'A:A');
Vel = xlsread(filename,6,'B:B');
Deg = xlsread(filename,6,'C:C');
F1 = xlsread(filename,6,'D:D');
F2 = xlsread(filename,6,'E:E');
Touch = xlsread(filename,6,'F:F');
%% 力量校正
if min(F1) < 0
    F1 = F1 - min(F1);
end
if min(F2) < 0
    F2 = F2 - min(F2);
end

windowSize = 15; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
F1 = filter(b,a,F1);
F2 = filter(b,a,F2);

%% Plot 參數值出來
P_para = F1
figure(1);
plot(Deg,P_para);
hold on;
Col = find(Touch == 0);
[m,n] = size(Col);

% %% 計算平均值
% temp = 0;
% j = 0;
% k = 1;
% for i=1:m
%     temp = temp + P_para(Col(i,1));
%     j = j + 1;
%     plot(Deg(Col(i,1)),P_para(Col(i,1)),'rs','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',1)
%     if i > 1
%         if (Col(i,1)-Col(i-1,1)) > 1
%             ave(k,1) = (temp- P_para(Col(i,1))) / (j-1);
%             ave(k,2) = j-1;
%             a = {'\leftarrow' num2str(ave(k,1),'%.4f ')};
%             text(Deg(Col(i-1,1)),P_para(Col(i-1,1)), a)
%             k = k+1;
%             temp = 0;
%             j = 0;
%         end
%     end
% end
% 
% %% PLOT出最後一個平均值
% ave(k,1) = temp / j;
% ave(k,2) = j;
% a = num2str(ave(k,1),'%.4f ');
% text(Deg(Col(i,1)),P_para(Col(i,1)),a )

hold on;
plot (Deg,F2)



%% plot 手指往下彎的力量
Deg_P = find (Deg>0 & Deg<169);
a = Deg_P(1);
Deg_PP = diff(Deg_P);
b = Deg_P(find(Deg_PP ~= 1));

figure (8);
h2 = plot(Deg(a:b)-Deg(a),F2(a:b));
xlabel('Degree');
ylabel('Tension(N)');
set(h2, 'linewidth',2);
    
%% plot 手指伸直的力量
Deg_P2 = find (Deg>0.5 & Deg<169);
Deg_PP2 = diff(Deg_P2);
a2 = Deg_P2(find(Deg_PP2 ~= 1));
b2 = Deg_P2(end);

figure (9);
h1 = plot(Deg(a2:b2),F1(a2:b2));
xlabel('Degree');
ylabel('Tension(N)');
set(h1, 'linewidth',2);

%% 
figure(5);
plot(T,F1,T,F2)
hold on

plot(T(a:b),F2(a:b),'rs','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',1)
plot(T(a2:b2),F1(a2:b2),'rs','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',1)
xlabel('Time(s)');
ylabel('Tension(N)')
legend('F1','F2')
