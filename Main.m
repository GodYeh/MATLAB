clear all;
clc;
%% 從Excel讀取原始數據
filename = '0324_test';
[T_1,T_2,T_3,T_4,T_5,Vel_1,Vel_2,Vel_3,Vel_4,Vel_5,Deg_1,Deg_2,Deg_3,Deg_4,Deg_5,F1_1,F1_2,F1_3,F1_4,F1_5,F2_1,F2_2,F2_3,F2_4,F2_5] = SubLoad(filename); % 讀取原始數據
% plot(Deg_1,F2_1,Deg_2,F2_2,Deg_3,F2_3);
plot(Deg_2,F1_2,Deg_2,F2_2)

%% 將所需的資料範圍抓出來存到對應的矩陣內
[Deg_1_GD,F2_1_GD] = DataRange('DOWN', 1, Deg_1, F2_1);
[Deg_2_GD,F2_2_GD] = DataRange('DOWN', 1, Deg_2, F2_2);
[Deg_3_GD,F2_3_GD] = DataRange('DOWN', 1, Deg_3, F2_3);
[Deg_4_GD,F2_4_GD] = DataRange('DOWN', 1, Deg_4, F2_4);
% [Deg_5_GD,F2_5_GD] = DataRange('DOWN', 1, Deg_5, F2_5);

[Deg_1_GU,F1_1_GU] = DataRange('UP', 1, Deg_1, F1_1);
[Deg_2_GU,F1_2_GU] = DataRange('UP', 1, Deg_2, F1_2);
[Deg_3_GU,F1_3_GU] = DataRange('UP', 1, Deg_3, F1_3);
[Deg_4_GU,F1_4_GU] = DataRange('UP', 1, Deg_4, F1_4);
% [Deg_5_GU,F1_5_GU] = DataRange('UP', 1, Deg_5, F1_5);

%% 處理區間數據至一致的角度變化輛，讓數據可綜合分析
[Deg_1_GD,F2_1_GD] = DataSorting('DOWN',Deg_1_GD,F2_1_GD);
[Deg_2_GD,F2_2_GD] = DataSorting('DOWN',Deg_2_GD,F2_2_GD);
[Deg_3_GD,F2_3_GD] = DataSorting('DOWN',Deg_3_GD,F2_3_GD);
[Deg_4_GD,F2_4_GD] = DataSorting('DOWN',Deg_4_GD,F2_4_GD);
[Deg_5_GD,F2_5_GD] = DataSorting('DOWN',Deg_5_GD,F2_5_GD);

[Deg_1_GU,F1_1_GU] = DataSorting('UP',Deg_1_GU,F1_1_GU);
[Deg_2_GU,F1_2_GU] = DataSorting('UP',Deg_2_GU,F1_2_GU);
[Deg_3_GU,F1_3_GU] = DataSorting('UP',Deg_3_GU,F1_3_GU);
[Deg_4_GU,F1_4_GU] = DataSorting('UP',Deg_4_GU,F1_4_GU);
[Deg_5_GU,F1_5_GU] = DataSorting('UP',Deg_5_GU,F1_5_GU);

% figure(2);
% plot(Deg_1_GD,F2_1_GD,Deg_2_GD,F2_2_GD,Deg_3_GD,F2_3_GD);

% [Deg_1_GD,F1_1_GU] = DataSorting(Deg_1_GD,F1_1_GU);

%% 求moving average
[F2_1_GD] = MovAve(F2_1_GD);
[F2_2_GD] = MovAve(F2_2_GD);
[F2_3_GD] = MovAve(F2_3_GD);
[F2_4_GD] = MovAve(F2_4_GD);
[F2_5_GD] = MovAve(F2_5_GD);

[F1_1_GU] = MovAve(F1_1_GU);
[F1_2_GU] = MovAve(F1_2_GU);
[F1_3_GU] = MovAve(F1_3_GU);
[F1_4_GU] = MovAve(F1_4_GU);
[F1_5_GU] = MovAve(F1_5_GU);

%% 算平均值
F2_MEAN = [F2_1_GD,F2_2_GD,F2_3_GD,F2_4_GD,F2_5_GD];
F1_MEAN = [F1_1_GU,F1_2_GU,F1_3_GU,F1_4_GU,F1_5_GU];

s2 = std(F2_MEAN,0,2);
s1 = std(F1_MEAN,0,2);

F2_MEAN = mean(F2_MEAN,2);
F1_MEAN = mean(F1_MEAN,2);

figure(10);
plot(Deg_1_GD, F2_MEAN, Deg_1_GD,F2_1_GD,Deg_2_GD,F2_2_GD,Deg_3_GD,F2_3_GD);
hold on;
errorbar(Deg_1_GD, F2_MEAN,s2);
errorbar(Deg_1_GU, F1_MEAN,s1);

figure(9);
plot(Deg_1_GD,s2)

plot(Deg_1_GU,s1)

plot(Deg_1_GU,F1_1_GU,Deg_2_GU,F1_2_GU,Deg_3_GU,F1_3_GU,Deg_4_GU,F1_4_GU,Deg_5_GU,F1_5_GU)


