function [y,terms] = NR_log1( x, MaxTerms )
%
% [y,terms] = NR_log1(x, MaxTerms )
%
% Computes log of the number x, using a MaxTerms terms.
%
% Input: x – Number that we want the natural log of.
%        MaxTerms – The maximum number of terms that are to be used.
%           [default: 1000]
% Output: y – log of x
%         terms – number of terms used.
%

if ( nargin < 2 ) % If no MaxTerms are entered
    MaxTerms = 1000; 
end

terms = 0;

y = x; % First guess for y
y1 = y -1; % Set previous value different from y

% Continue up until the values are close or reach MaxTerms
while abs( y - y1 ) > eps && terms < MaxTerms
    y1 = y; % Save previous value of y
    y = y - 1 + x / exp( y ); % NR for log
    terms = terms + 1; 
end
return;