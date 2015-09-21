function [ c,ceq ] = mycon( x )
%MYCON Summary of this function goes here
%   Detailed explanation goes here

M = 194.295; % 列车质量(t)

v(1)=0;

for i=1:135
    W(i) = w_zu(v(i),i)*9.8*M*sign(v(i))/1000;
    a(i) = (max(x(i),0)*fMax(v(i))+min(x(i),0)*bMax(v(i))-W(i))/M; % 加速度 (m/s^2)
    if a(i)>1
        x(i) = 1-(a(i)-1)*M/fMax(v(i));
        a(i) = 1;
    end
    v(i+1) = sqrt(max(2*a(i)*10+v(i)^2,0));
end

t_total = 0;
for i=1:135
    t_total = t_total+(v(i+1)-v(i))/a(i);
end
% ceq(1,1) = t_total-110;

% if isnan(ceq(1,1))
%     ceq(1,1) = 1000-110;
% end
ceq = v(136);

% for i=1:136
%     f_max(i) = fMax(v(i));
%     b_max(i) = bMax(v(i));
% end

c_left = [];
c_left(1:135) = v(1:135);
% c_left(137:272) = a;
c_left(136:269) = -v(2:135);
c_left(270) = t_total;
c_left(271) = -t_total;
% c_left(273:408) = -a;
% c_left(409:544) = f_max(1:136);
% c_left(545:680) = b_max(1:136);

c_right(1:12) = 80/3.6;
c_right(13:135) = 80/3.6;
c_right(136:269) = -0.1;
c_right(270) = 113;
c_right(271) = -107;
% c_right(137:408) = 1;
% c_right(409:544) = 194.295;
% c_right(545:680) = 194.295;
% c_right(409:543) = -0.1;

c_left = c_left'; c_right = c_right';
c = c_left-c_right;


end

