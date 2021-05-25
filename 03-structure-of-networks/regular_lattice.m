function A = regular_lattice(n, k)
% REGULAR_LATTICE  Generates a regular lattice (as described by Watts & Strogatz) with n nodes each connected to 2k 'nearest' neighbours
%   A = regular_lattice(n, k) generates a regular lattice containing n nodes with 
%         each node being connected to 2k nodes.
%
% USAGE:
%    A = regular_lattice(n, k)
%
% INPUTS:
%    n:       Number of nodes in the desired regular lattice
%    k:       number of nearest neighbours (on each 'side')
%
% OUTPUT:
%    A:       Sparse adjacency matrix, corresponding to the regular lattice, 
%               containing 2*n*k edges.
%
% See also ERDOS_RENYI, BARABASI_ALBERT.
% 

src = reshape(repmat(1:n, 2*k, 1), [], 1);
dest = zeros(n*2*k, 1);
for u = 1:n
    dest((u-1)*2*k+1:u*2*k) = mod([u-k:u-1 u+1:u+k]-1, n) + 1;
end
A = sparse(src, dest, 1);

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


