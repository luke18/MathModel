function f = fun(x) % kJ

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

f = 0;
for i=1:135
    f = f+10*max(x(i),0)*fMax(v(i));
end


end