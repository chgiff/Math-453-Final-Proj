globalGuess1 = PSO(@f_peaks, [-3,3], [-3,3], 24);

%inital simplex
M = [-1,1; 1,0; 0,1];
%x = nelder_mead(M, @f_peaks, 1);
%globalGuess2 = x(1);

localGuess1 = conj_grad(@Df_peaks, globalGuess1, [1,10^-7]); 

%localGuess2 = quasi_newton(@Df_peaks, globalGuess1, [1,0; 0,1], [1, 10^-7]);