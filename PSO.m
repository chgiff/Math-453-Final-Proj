% @author Chandler Gifford
%
% @params
%   func - function handler
%   x_constraint - range of x values to search between in form [x1, x2]
%   y_constraint - range of y values  in form [y1, y2]
% 
% @return the vector than minimizes the function

function x_min = PSO(func, x_constraint, y_constraint, tolerance, fig_id)

%widths of x and y constraints0
x_width = abs(x_constraint(1) - x_constraint(2));
y_width = abs(y_constraint(1) - y_constraint(2));
%constraint offsets
x_offset = min(x_constraint(1), x_constraint(2));
y_offset = min(y_constraint(1), y_constraint(2));

iter = 5;

omega = .5;
C1 = .9;
C2 = 1.1;

soln = [0.228278911985387; -1.625534953142922];

%number of particles
particles = 10;
X = rand(particles);
X = X(:, 1:2);
X(:, 1) = x_width.*X(:, 1) + x_offset;
X(:, 2) = y_width.*X(:, 2) + y_offset;

P = X;
g = findMin(func, P);
prevG = 1000;
generations = 0;

V = rand(particles);
V = V(:, 1:2);

%contour plot
%TODO, change to right range
Q = [x_constraint(1):0.05:x_constraint(2)]';
R = [y_constraint(1):0.05:y_constraint(2)]';
[x,y] = meshgrid(Q',R');
z = x;
for idx = 1:numel(x)
    z(idx) = func([x(idx), y(idx)]);
end

levels = [-7:.5:8];
figure ( fig_id )
hold on
contour(Q,R,z,levels)
a = X(:,1);
b = X(:,2);
scatter(a,b, 'filled', 'k');
xlabel('x_1')
ylabel('x_2')
title('Particle Swarm on Matlab "peaks" function')
%hold off;
pause;

%loop
fprintf('Starting particle swarm global optimiztion\n');
fprintf('k\t\tCurent Minimizer\tError\n');
for k = 1:iter
r = rand(particles);
r = r(:, 1:2);

s = rand(particles);
s = s(:, 1:2);

V = omega.*V + C1.*r.*(P - X) + C2.*s.*(gMatrix(g, particles) - X);
X = X + V;

%find new P's
for i = 1:particles
    if(func(X(i,:)) < func(P(i,:)))
        P(i,:) = X(i,:);
    end 
end
prevG = g;
g = findMin(func, P);

% if(prevG - g < tolerance)
%     if(generations < 3)
%         generations = generations +1;
%     else
%         fprintf('Exiting, difference in minimum less than tolerancse\n');
%         disp(tolerance);
%         fprintf(' for 4 generations\n');
%         x_min = g';
%         return;
%     end
% else 
%     generations = 0;
% end

fprintf('%i\t  (%.4f, %.4f)\t\t%.5f\n', k, g(1), g(2), sqrt((g(1) - soln(1))^2 + (g(2) - soln(2))^2));

%plot points
hold off
a = X(:,1);
b = X(:,2);
contour(Q,R,z,levels)
hold on
scatter(a,b, 'filled', 'k');
pause;

end

fprintf('Minimizer: [%.4f, %.4f]\n', g(1), g(2));

x_min = g';


function g = findMin(func, P)
g = P(1,:);
for i = 1:size(P,1)
    if(func(P(i,:)) < func(g))
        g = P(i,:);
    end
end

function G = gMatrix(g, length)
G = [];
for i = 1:length
    G(i,:) = g;
end
