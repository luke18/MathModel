function [ w ] = w_zu( v,i)
%W_ZU Summary of this function goes here
%   Detailed explanation goes here


if i<304
    w = 2.031+0.0622*3.6*v+0.001807*(3.6*v)^2;
elseif i<684
    w = 2.031+0.0622*3.6*v+0.001807*(3.6*v)^2+1.8;
elseif i<1304
    w = 2.031+0.0622*3.6*v+0.001807*(3.6*v)^2-3.5;
else
    w = 2.031+0.0622*3.6*v+0.001807*(3.6*v)^2;
end



end

