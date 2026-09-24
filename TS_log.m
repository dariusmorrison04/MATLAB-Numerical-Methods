function [y,terms] = TS_log( x, MaxTerms )
%
% [y,terms] = TS_log(x, MaxTerms )
%
% Computes log of the number x, using a MaxTerms terms.
%
% Input: x – Number that we want the natural log of.
%        MaxTerms – The maximum number of terms that are to be used.
%            [default: 1000]
% Output: y – log of x
%         terms – number of terms used.
%
if ( nargin < 2 ) % if no MaxTerms are entered
    MaxTerms = 1000; % Default to 1000
end

LogConst = 0.69314718055994529; % Log 2 constant

k = 1; 
terms = 0; 

y = zeros( size ( x ) ); % Start answer at zero
yOld = ones( size( x ) ); % Save previous value

% Defines range of Taylors Series (0 < x < 2)
while x >= 2
    x = x / 2;
    y = y + LogConst;
end

for k = 1 : MaxTerms % From k = 1 to MaxTerms
    yOld = y; % Save past value
    y = y + ( ( ( -1 )^( k + 1 ) )*( ( x - 1 )^k ) / k );
    terms = terms + 1; % Increment terms variable

    if y == yOld % Ends loop when solution is found
        break;
    end

end % End for loop.

return;