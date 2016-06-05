realMin = [0.228278911985387; -1.625534953142922];

globalGuess1 = PSO(@f_peaks, [-3,3], [-3,3], .2, 24);

%inital simplex
M = [-1,1; 1,0; 0,1];
%globalGuess2 = nelder_mead(M, @f_peaks, 1);

%localGuess1 = conj_grad(@Df_peaks, globalGuess1, [1, 10^-7, 10^-10]);

localGuess2 = quasi_newton(@Df_peaks, globalGuess1, [1,0; 0,1], [1, 10^-7, 10^-10]);