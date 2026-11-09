function [t_out, x_out] = euler_forward(odefun, t_f, x0, h) 
% EULER_FORWARD  Integrates a given ODE function using the Euler Forward method
%   [t_out, x_out] = euler_forward(odefun, t_f, x0, h) integrates the given ODE
%         function from 0 to t_f, using a ∆t = h
%
% USAGE:
%    [t_out, x_out] = euler_forward(odefun, t_f, x0, h)
%
% INPUTS:
%    odefun:  Function handle, that points to a function that computes 
%               xdot = f(t, x)
%    t_f:     Final time-point until which the integration must be performed
%    x0:      Initial value of x at t = 0 (a scalar or a column vector)
%    h:       The step-size of ∆t
%
% OUTPUT:
%    t_out:   The time-points at which the integration has been performed,
%               0, h, 2h, ..., t_f (as a column vector)
%    x_out:   Values of x at the time-points t_out, one row per time-point
%
% See also ode15s.

nIter = round(t_f/h) ;
t_out = h*(0:nIter)' ;
x_out = zeros(nIter+1, numel(x0)) ;

x = x0(:);
x_out(1, :) = x' ;
for i = 1:nIter
  dxdt = odefun(t_out(i), x);
  x = x + dxdt(:)*h;
  x_out(i+1, :) = x' ;
end

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


