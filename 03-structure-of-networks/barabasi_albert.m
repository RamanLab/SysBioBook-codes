function A = barabasi_albert(n)
% BARABASI_ALBERT  Generates a Barabási–Albert scale-free random network G(n, p)
%   A = barabasi_albert(n, p) generates a random network with n nodes by the 
%         preferential attachment algorithm, beginning with a single edge 
%         between two nodes.
%
% USAGE:
%    A = barabasi_albert(n, p)
%
% INPUTS:
%    n:       Number of nodes in the desired graph
%
% OUTPUT:
%    A:       Sparse symmetric adjacency matrix, corresponding to the 
%               Barabási–Albert scale-free random network
%
% See also ERDOS_RENYI, REGULAR_LATTICE.

degrees = zeros(n, 1);
i = zeros(n-1, 1);
i(1) = 1;
degrees(1:2) = 1;
for k = 3:n
    % add a node picking the node to connect to, randomly, based on degree
    newLink = randsample(1:k-1, 1, true, degrees(1:k-1)); 
    degrees([newLink; k]) = degrees([newLink; k]) + 1; % update degrees
    i(k-1) = newLink;
end

A = sparse(i, 2:k, 1, n, n);
A = A + A';

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


