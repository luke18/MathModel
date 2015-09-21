function [ c,ceq ] = mycon_1m( x )
%MYCON Summary of this function goes here
%   Detailed explanation goes here

M = 194.295; % 列车质量(t)

% x = zeros(1354,1);
% x(1:y(1)) = 1;
% x(1354-y(2)+1:1354) = -1;

v(1)=0;

for i=1:1354
    W(i) = w_zu(v(i),i)*9.8*M*sign(v(i))/1000;
    a(i) = (max(x(i),0)*fMax(v(i))+min(x(i),0)*bMax(v(i))-W(i))/M+0.0001; % 加速度 (m/s^2)
    if a(i)>1
        x(i) = 1-(a(i)-1)*M/fMax(v(i));
        a(i) = 1;
    end
    v(i+1) = sqrt(max(2*a(i)*1+v(i)^2,0));
end

% f = 4*max(x(1),0)*fMax(v(1));
% for i=2:136
%     f = f+10*max(x(i),0)*fMax(v(i));
% end

t_total = 0;
for i=1:1354
    %     if and(v(i+1) == 0,i<1354)
    %         t_total = 1000;
    %     else
    t_total = t_total+(v(i+1)-v(i))/a(i);
    %     end
end
% ceq(1,1) = t_total-110;

% if isnan(ceq(1,1))
%     ceq(1,1) = 1000-110;
% end
ceq = [];

% for i=1:136
%     f_max(i) = fMax(v(i));
%     b_max(i) = bMax(v(i));
% end

c_left = [];
c_left(1:1354) = v(1:1354);
% c_left(137:272) = a;
c_left(1355:2707) = -v(2:1354);
c_left(2708) = t_total;
c_left(2709) = -t_total;
c_left(2710) = v(1355);
c_left(2711) = -v(1355);
% c_left(274) = f;
% c_left(273:408) = -a;
% c_left(409:544) = f_max(1:136);
% c_left(545:680) = b_max(1:136);

c_right(1:120) = 55/3.6;
c_right(121:1354) = 80/3.6;
c_right(1355:2707) = -0.1;
c_right(2708) = 111;
c_right(2709) = -109;
c_right(2710) = 0;
c_right(2711) = 0;
% c_right(274) = 26000;
% c_right(137:408) = 1;
% c_right(409:544) = 194.295;
% c_right(545:680) = 194.295;
% c_right(409:543) = -0.1;

c_left = c_left'; c_right = c_right';
c = c_left-c_right;

aaaa= 0;
end

