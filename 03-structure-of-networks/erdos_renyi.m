function A = erdos_renyi(n, p)
% ERDOS_RENYI  Generates a Erdős–Rényi random network G(n, p)
%   A = erdos_renyi(n, p) generates a random network with n nodes with 
%         each pair of nodes being connected with a probability p.
%
% USAGE:
%    A = erdos_renyi(n, p)
%
% INPUTS:
%    n:       Number of nodes in the desired graph
%    p:       Probability of connecting any given pair of nodes
%
% OUTPUT:
%    A:       Sparse symmetric adjacency matrix, corresponding to the 
%               Erdős–Rényi random network
%
% See also REGULAR_LATTICE, BARABASI_ALBERT.

A=sparse(squareform(rand(n*(n-1)/2,1)<p));

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


