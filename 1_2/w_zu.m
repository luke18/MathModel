function [ w ] = w_zu( v1,i)
%W_ZU Summary of this function goes here
%   Detailed explanation goes here

v = 3.6*v1;

if i<31
    w = 2.031+0.0622*v+0.001807*v^2;
elseif i<69
    w = 3.831+0.0622*v+0.001807*v^2;
elseif i<131
    w = -1.469+0.0622*v+0.001807*v^2;
elseif i<160
    w = 2.031+0.0622*v+0.001807*v^2;
elseif i<200
    w = 5.031+0.0622*v+0.001807*v^2;
elseif i<256
    w = 0.031+0.0622*v+0.001807*v^2;
else 
    w = 2.031+0.0622*v+0.001807*v^2;
end



end

