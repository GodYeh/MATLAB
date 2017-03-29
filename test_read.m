clear all;
clc;

filename = '0329';
sheet = 1;
T = zeros(1,60000);
Deg = zeros(1,60000);
F1 = zeros(1,60000);
F2 = zeros(1,60000);
456
123

T = xlsread(filename,sheet,'A:A');
Deg = xlsread(filename,sheet,'C:C');
F1 = xlsread(filename,sheet,'D:D');
F2= xlsread(filename,sheet,'E:E');
e = 2*15/sqrt(709);
F1 = F1/e;
F2 = F2/e;
F1 = F1 - min(F1);
F2 = F2 - min(F2);
%%

Deg4F2_all = [];
Deg4F1_all = [];
F2_all = [];
F1_all = [];

for num = 1:2    
[Deg2, F2_1] = DataRange('DOWN',num ,Deg,F2);
[Deg2, F2_1] = DataSorting('DOWN', Deg2, F2_1);
Deg4F2_all = [Deg4F2_all, Deg2];
F2_all = [F2_all, F2_1];

[Deg1, F1_1] = DataRange('UP',num ,Deg,F1);
[Deg1, F1_1] = DataSorting('UP', Deg1, F1_1);
Deg4F1_all = [Deg4F1_all, Deg1];
F1_all = [F1_all, F1_1];
end

F2_mean = mean(F2_all,2);
F1_mean = mean(F1_all,2);
figure (2)
plot(Deg2, F2_mean);
plot(Deg4F2_all, F2_all);

figure (1)
% plot(Deg1, F1_mean);
% plot(Deg4F1_all, F1_all);

subplot(3,1,1); plot(Deg1, F1_mean, Deg4F1_all, F1_all);
subplot(3,1,2); plot(Deg2, F2_mean, Deg4F2_all, F2_all);
subplot(3,1,3);	plot(Deg2, F2_mean,Deg1, F1_mean)


%% 多項式趨近
figure(4)

[theta2,D] = polyfit(Deg2, F2_mean, 10);
Y2 = polyval(theta2, Deg2)
[theta1,D] = polyfit(Deg1, F1_mean, 8);
Y1 = polyval(theta1, Deg1)


subplot(2,1,1);	plot(Deg2, Y2, Deg1, Y1,Deg2, F2_mean,Deg1, F1_mean);
subplot(2,1,2);	plot(Deg2, F2_mean,Deg1, F1_mean)