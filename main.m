PSO(@f_peaks, [-3,3], [-3,3], 24);

%inital simplex
M = [-1,1; 1,0; 0,1];
nelder_mead(M, @f_peaks, 1);