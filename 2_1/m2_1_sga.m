% function [x,fval,exitflag,output,population,score] = m1_1_ga
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = gaoptimset;
%% Modify options setting
options = gaoptimset(options,'Display', 'iter');

lb = [11,8,1,22,14,4,5,7,3,11,129,5,13];
for i=1:13
    ub(i) = fix(segStation(i,3)/3);
end
ub = lb+ub;
A=[];b=[];
inter = [1:13];

[x,fval] = ...
ga(@(y)fun_sga(y,posStation,segA),13,A,b,[],[],...
    lb,ub,@(y)mycon_sga(y,posStation,segA,segV),inter,options);
