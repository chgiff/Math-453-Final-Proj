%sample peaks function to minimize

function y=f_peaks(x)
if(size(x) ~= 2)
    y=0;
    return
end
y=3*(1-x(1)).^2.*exp(-(x(1).^2)-(x(2)+1).^2) - 10.*(x(1)/5-x(1).^3-x(2).^5).*exp(-x(1).^2-x(2).^2) - exp(-(x(1)+1).^2-x(2).^2)/3;
y=-y;