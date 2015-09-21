function fmax = fMax(v1) % 最大牵引力(kN)
    v = 3.6*v1;
    if v<=51.5
        fmax = 203;
    else 
        fmax = -0.002032*v^3+0.4928*v^2-42.13*v+1343;
    end
end