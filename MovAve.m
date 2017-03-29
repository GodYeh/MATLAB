%% ¨ú²¾°Ê¥­§¡
function [F_Output] = MovAve(F_Input)


windowSize = 15; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
F_Output = filter(b,a,F_Input);
