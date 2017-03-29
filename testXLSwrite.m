clear all
clc

filename = 'xlswrite_test.xlsx';
a={1;1;1;5};
xlswrite(filename,a,'1','C');