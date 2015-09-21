function f = fun_sga(y,posStation,segA) % kJ

M = 194.295; % 列车质量(t)
% x = zeros(2273,1);
% t_total = 0;
f = 0;
for i=[1:10,12,13]
    start = posStation(i,2);
    dest = posStation(i+1,2);
    [ bSeg,t_total_o,f_o,v_o ] = brake_seg( start,dest,y(i),segA);
%     t_total = t_total+t_total_o;
    f = f+f_o;
%     v(start,dest) = v_o;
end




end