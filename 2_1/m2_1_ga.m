% function [x,fval,exitflag,output,population,score] = m1_1_ga
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = gaoptimset;
%% Modify options setting
options = gaoptimset(options,'Display', 'iter');

lb = zeros(1,26);
for i=1:13
    ub(i*2-1) = fix(segStation(i,3)/3);
    ub(i*2) = fix(segStation(i,3)/3);
end
A=[];b=[];
inter = [1:26];

[x,fval] = ...
ga(@(y)fun_ga(y,posStation,segA),26,A,b,[],[],...
    lb,ub,@(y)mycon_ga(y,posStation,segA,segV),inter,options);
