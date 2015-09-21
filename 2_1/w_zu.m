function [ w ] = w_zu( v1,i,segA)
%W_ZU Summary of this function goes here
%   Detailed explanation goes here

v = 3.6*v1;

w = segA(i)+0.0622*v+0.001807*v^2;

end

