function [ c,ceq ] = mycon_sga( y,posStation,segA,segV )
%MYCON Summary of this function goes here
%   Detailed explanation goes here

M = 194.295; % 列车质量(t)
run_time = 2086-12*30-53.3487; % 列车行驶时间

% x = zeros(2273,1);
t_total = 0;
f = 0;
v = zeros(2274)+1;
for i=[1:10,12,13]
    start = posStation(i,2);
    dest = posStation(i+1,2);
    [ bSeg,t_total_o,f_o,v_o ] = brake_seg( start,dest,y(i),segA);
    t_total = t_total+t_total_o;
    f = f+f_o;
    v(start:dest) = v_o;
end


ceq = [];

% for i=1:136
%     f_max(i) = fMax(v(i));
%     b_max(i) = bMax(v(i));
% end
% pure_v = v;
% pure_v(posStation(:,2)) = [];

c_left = [];
c_left(1:2273) = v(2:2274); % 所有v小于限速
% c_left(137:272) = a;
% c_left(2274:4533) = -pure_v; % 所有非站速大于0

c_left(2274) = t_total;
c_left(2275) = -t_total;
% c_left(4535:4548) = v(posStation(:,2)); % 站速等于0
% c_left(4548:4561) = -v(posStation(:,2)); % 站速等于0

% c_left(274) = f;
% c_left(273:408) = -a;
% c_left(409:544) = f_max(1:136);
% c_left(545:680) = b_max(1:136);

c_right(1:2273) = segV(1:2273)/3.6;
% 
% c_right(2274:4533) = -0.1;
c_right(2274) = run_time+5;
c_right(2275) = -run_time+5;
% c_right(4535:4561) = 0;

% c_right(274) = 26000;
% c_right(137:408) = 1;
% c_right(409:544) = 194.295;
% c_right(545:680) = 194.295;
% c_right(409:543) = -0.1;

c_left = c_left'; c_right = c_right';
c = c_left-c_right;


end

