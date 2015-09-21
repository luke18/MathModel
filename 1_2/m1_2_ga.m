% function [x,fval,exitflag,output,population,score] = m1_1_ga
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = gaoptimset;
%% Modify options setting
options = gaoptimset(options,'Display', 'iter');

lb = [0,0,0,0];
ub = [40,40,40,40];
A=[];b=[];
inter = [1,2,3,4];
[x,fval] = ...
ga(@fun_ga,4,A,b,[],[],...
    lb,ub,@mycon_ga,inter,options);
