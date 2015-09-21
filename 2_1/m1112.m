M = 194.295; % 列车质量(t)
start = posStation(11,2);
dest = posStation(12,2);
seg = dest-start;
for j=1:seg
    x = zeros(seg,1);
    
    x(1:seg-j) = 1;
    x(seg-j+1:seg) = -1;
   
    v(1)=0;
    t_total=0;
    f = 0;
    for i=1:seg
        W(i) = w_zu(v(i),i+start-1,segA)*9.8*M*sign(v(i))/1000;
        a(i) = (max(x(i),0)*fMax(v(i))+min(x(i),0)*bMax(v(i))-W(i))/M; % 加速度 (m/s^2)
        if a(i)>1
            x(i) = 1-(a(i)-1)*M/fMax(v(i));
            a(i) = 1;
        end
        v(i+1) = sqrt(max(2*a(i)*10+v(i)^2,0));
        if v(i+1)>segV(i)/3.6
            v(i+1) = segV(i)/3.6;
            x(i) = W(i)/fMax(v(i));
        end
        t_total = t_total+(v(i+1)-v(i))/a(i);
        f = f+10*max(x(i),0)*fMax(v(i));
    end
    
    if and(v(seg)>0,v(seg+1)==0)
        bSeg = j;
        t_total_o = t_total;
        f_o = f;
        v_o = v;
        return;
    end
    
end
%% img
distance = zeros(1,seg+1);
distance(1)=0;
for i=2:seg
    distance(i+1)=distance(i)+10;
end

figure
plot(distance,v_o)
xlabel('距离')
ylabel('速度')
