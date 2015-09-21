function bmax = bMax(v1) % 最大制动力(kN)
    v = 3.6*v1;
    if v<=77
        bmax = 166;
    else 
        bmax = 0.1343*v^2-25.07*v+1300;
    end
end