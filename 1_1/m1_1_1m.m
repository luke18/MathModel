% function [x,fval,exitflag,output,lambda,grad,hessian] = 1_1
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fmincon');
%% Modify options setting
options = optimoptions(options,'Display', 'iter','MaxFunEvals',10000);

%% Parameters
M = 194.295; % 列车质量(t)

lb = zeros(1354,1)-1.001;
ub = zeros(1354,1)+1.001;
x0 = zeros(1354,1);
x0(1:130,1) = 1;
x0(1274:1354,1) = -1;
% x0 = x0+rand();
% x0 = x;
% x0 = x;
A=[];B=[];Aeq=[];Beq=[];


[x,fval] = fmincon(@fun_1m,x0,A,B,Aeq,Beq,lb,ub,@mycon_1m ,options)
