%real answer for calculating error
realMin = [0.228278911985387; -1.625534953142922];

%begin global - choose 1

globalGuess = PSO(@f_peaks, [-3,3], [-3,3], .2, 27 );

%inital simplex
M = [-1,1; 1,0; 0,1];
%globalGuess = nelder_mead(M, @f_peaks, 1);

%end global

%begin local - choose 1 

% localGuess1 = conj_grad(@Df_peaks, globalGuess, [1, 10^-7,  10^-10]);

localGuess2 = quasi_newton(@Df_peaks, globalGuess, [1,0; 0,1], [1, 10^-7, 10^-10]);

%end local