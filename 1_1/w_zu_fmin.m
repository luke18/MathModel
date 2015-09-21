function [ w ] = w_zu_fmin( v1,i)
%W_ZU Summary of this function goes here
%   Detailed explanation goes here
v = 3.6*v1;

if i<30
    w = 2.031+0.0622*3.6*v+0.001807*(3.6*v)^2;
elseif i<68
    w = 2.031+0.0622*3.6*v+0.001807*(3.6*v)^2+1.8;
elseif i<130
    w = 2.031+0.0622*3.6*v+0.001807*(3.6*v)^2-3.5;
else
    w = 2.031+0.0622*3.6*v+0.001807*(3.6*v)^2;
end



end

