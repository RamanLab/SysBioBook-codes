%% Euler Forward Method Illustration
% ---------------------------------
% This script illustrates the use of the the Euler forward method to model a
% simple 'system' with a single differential equation. This code can essentially
% be used as a template for solving other models.
%
% Running this piece of code generates a plot with three curves:
% 1 - a blue curve (points denoted by carets) with ∆t = 1/40
% 2 - a green curve (points denoted by circles) with ∆t = 1/100
% 3 - a black curve, obtained by using MATLAB ODE solver, ode15s
%
% See also ODE15S.

%% Make three plots to examine the effect of ∆t
[time, x_all] = ef(1/40);
plot(time, x_all, 'b^-')
xlabel('t')
ylabel('x(t)')
hold on

[time, x_all] = ef(1/100);
plot(time, x_all, 'go-')

[t, y]=ode15s(@f, [0 0.5], 1);
plot(t, y, 'k-')

legend('∆t = 1/40', '∆t = 1/100', 'ode15s');

%% The function xdot encoding our ODE
function xdot = f(t, x)
% A function that encodes the differential equation xdot = f(t, x) = a - bx
a = 0;
b = 30;
c = 1;

xdot = a - b*x;
end

%% The function 'ef' for Euler forward
function [time, x_all] = ef(dt)
% A simple implementation of the Euler forward method
a = 0;
b = 30;
c = 1;

tlast = 0.5;

iterations = round(tlast/dt);
x_all = zeros(iterations, 1);

x = c; % x0
for i = 1:iterations
  x_all(i) = x;
  dxdt = a - b*x;
  x = x + dxdt*dt;
end

time = dt*(0:iterations-1)';
end

% These codes are adapted from:
% E. A. Sobie (2011) An introduction to dynamical systems. Sci. Signal. 4:tr6
%
%% COPYRIGHT NOTICE
% 
% Copyright 2021, Karthik Raman
%
% Developed for use with the book:
%
%    An Introduction to Computational Systems Biology:  Systems-Level Modelling 
%      of Cellular Networks
%    Karthik Raman (2021) | CRC Press, Boca Raton, FL
%    ISBN 9781138597327 (hardback) | ISBN 9780429486951 (ebook)
% 
% Code Repository: https://github.com/RamanLab/SysBioBook-Codes
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.


