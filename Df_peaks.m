% Create your won!

function y=Df_peaks(x)
y = [-2/3*exp(-x(1)^2-(x(2)+1)^2)*(exp(2*x(1)+2*x(2)+1)*(30*x(1)^4-51*x(1)^2+30*x(1)*x(2)^5+3)+9*exp(2*x(1))*(x(1)^3-2*x(1)^2+1)+(x(1)+1)*(-exp(2*x(2)))); -2/3*exp(-x(1)^2-(x(2)+1)^2)*(3*x(2)*exp(2*x(1)+2*x(2)+1)*(10*x(1)^3-2*x(1)+5*x(2)^3*(2*x(2)^2-5))+9*exp(2*x(1))*(x(1)-1)^2*(x(2)+1)-exp(2*x(2))*x(2))];
y = -y;
