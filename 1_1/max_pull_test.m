

for k = 13:13
    for j=9:9
        x = zeros(1,136);
        x(1:k) = 1;
        x((137-j):136) = -1;
        M = 194.295; % 列车质量(t)
        
        v(1)=0;
        W(1) = w_zu(v(1),1)*9.8*M*sign(v(1))/1000;
        a(1) = (max(x(1),0)*fMax(v(1))+min(x(1),0)*bMax(v(1))-W(1))/M;
        v(2) = sqrt(2*a(1)*4+v(1)^2);
        for i=2:136
            W(i) = w_zu(v(i),i)*9.8*M*sign(v(i))/1000;
            a(i) = (max(x(i),0)*fMax(v(i))+min(x(i),0)*bMax(v(i))-W(i))/M; % 加速度 (m/s^2)
            v(i+1) = sqrt(max(2*a(i)*10+v(i)^2,0));
        end
        
        f = 4*max(x(1),0)*fMax(v(1));
        for i=2:136
            f = f+10*max(x(i),0)*fMax(v(i));
        end
        
        t_total = 0;
        for i=1:136
            if v(i)+v(i+1) == 0
                t_total = 220;
            else
                t_total = t_total+(v(i+1)-v(i))/a(i);
            end
        end
        t_total
        if abs(t_total-110)<5
            break;
        end
    end
end