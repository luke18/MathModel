for j=1:a(1,1)-1
    segA(j) = a(1,2);
end
for i=2:112
    for j=a(i-1,1):a(i,1)-1
        segA(j) = a(i,2);
    end
end

%% 1
for j=1:aaa(1,1)-1
    segV(j) = aaa(1,3);
end
for i=2:33
    for j=aaa(i-1,1):aaa(i,1)-1
        segV(j) = aaa(i,3);
    end
end