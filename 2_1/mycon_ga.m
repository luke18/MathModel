function [ c,ceq ] = mycon_ga( y,posStation,segA,segV )
%MYCON Summary of this function goes here
%   Detailed explanation goes here

M = 194.295; % 列车质量(t)
run_time = 2086-12*30; % 列车行驶时间

x = zeros(2273,1);
for i=1:13
    x(posStation(i,2):posStation(i,2)+y(2*i-1)-1) = 1;
    x(posStation(i+1,2)-y(2*i):posStation(i+1,2)-1) = -1;
end

v(1)=0;
% W(1) = w_zu(v(1),1)*9.8*M*sign(v(1))/1000;
% a(1) = (max(x(1),0)*fMax(v(1))+min(x(1),0)*bMax(v(1))-W(1))/M;
% if a(1)>1
%     x(1) = 1-(a(1)-1)*M/fMax(v(1));
%     a(1) = 1;
% end
% v(2) = sqrt(max(2*a(1)*10+v(1)^2,0));
for i=1:2273
    W(i) = w_zu(v(i),i,segA)*9.8*M*sign(v(i))/1000;
    a(i) = (max(x(i),0)*fMax(v(i))+min(x(i),0)*bMax(v(i))-W(i))/M; % 加速度 (m/s^2)
    if a(i)>1
        x(i) = 1-(a(i)-1)*M/fMax(v(i));
        a(i) = 1;
    end
    v(i+1) = sqrt(max(2*a(i)*10+v(i)^2,0));
end

% f = 4*max(x(1),0)*fMax(v(1));
% for i=2:136
%     f = f+10*max(x(i),0)*fMax(v(i));
% end

t_total = 0;
for i=1:2273
    t_total = t_total+(v(i+1)-v(i))/a(i);
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
pure_v = v;
pure_v(posStation(:,2)) = [];

c_left = [];
c_left(1:2273) = v(2:2274); % 所有v小于限速
% c_left(137:272) = a;
c_left(2274:4533) = -pure_v; % 所有非站速大于0

c_left(4534) = t_total;
c_left(4535) = -t_total;
c_left(4535:4548) = v(posStation(:,2)); % 站速等于0
c_left(4548:4561) = -v(posStation(:,2)); % 站速等于0

% c_left(274) = f;
% c_left(273:408) = -a;
% c_left(409:544) = f_max(1:136);
% c_left(545:680) = b_max(1:136);

c_right(1:2273) = segV(1:2273)/3.6;

c_right(2274:4533) = -0.1;
c_right(4534) = run_time+5;
c_right(4535) = -run_time+5;
c_right(4535:4561) = 0;

% c_right(274) = 26000;
% c_right(137:408) = 1;
% c_right(409:544) = 194.295;
% c_right(545:680) = 194.295;
% c_right(409:543) = -0.1;

c_left = c_left'; c_right = c_right';
c = c_left-c_right;


end

