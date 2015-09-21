function f = fun_ga(y) % kJ

M = 194.295; % 列车质量(t)

x = zeros(1354,1);
x(1:y(1)) = 1;
x(1354-y(2)+1:1354) = -1;

v(1)=0;
W(1) = w_zu(v(1),1)*9.8*M*sign(v(1))/1000;
a(1) = (max(x(1),0)*fMax(v(1))+min(x(1),0)*bMax(v(1))-W(1))/M;
if a(1)>1
    x(1) = 1-(a(1)-1)*M/fMax(v(1));
    a(1) = 1;
end
v(2) = sqrt(max(2*a(1)*1+v(1)^2,0));
for i=2:1354
    W(i) = w_zu(v(i),i)*9.8*M*sign(v(i))/1000;
    a(i) = (max(x(i),0)*fMax(v(i))+min(x(i),0)*bMax(v(i))-W(i))/M; % 加速度 (m/s^2)
    if a(i)>1
        x(i) = 1-(a(i)-1)*M/fMax(v(i));
        a(i) = 1;
    end
    v(i+1) = sqrt(max(2*a(i)*1+v(i)^2,0));
end

f = 0;
for i=1:1354
    f = f+1*max(x(i),0)*fMax(v(i));
end


end