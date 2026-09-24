function x = BiSection( x0, x1, f )
%
% Function that uses Bisection to search for root of f(x)
% Inputs: x0 and x1 - inital points used in iteration
%         f - function to be searched.
% Outputs: x - array of points moving toward root.
%
    
x = [x0; x1];
fx0 = f(x0);
fx1 = f(x1);
% if f(x) at the initial end points have the same sign
if fx0*fx1 > 0
    % return with warning and a null matrix.
    %disp('Invalid initial end points given' );
    x = [];
    return;
end
% Loop until x0 and x1 are basically the same.
while abs(x0-x1)/abs(x0+x1) > 2*eps
    x2 = (x0+x1)/2; % x2 is mid point.
    x = [x; x2]; % keep track of how it moved.
    fx2 = f(x2); % compute f(x2)
    if fx0*fx2 > 0 % if fx0 and fx2 are of the same sign
        x0 = x2; % replace x0 with x2.
        fx0 = fx2;
    else
        if fx1*fx2 > 0 % if fx1 and fx2 are of the same sign
            x1 = x2; % replace x1 with x2.
            fx1 = fx2;
        else
            x0 = x1;
        end
    end %end of if
end % end of while
% return not necessary at end of function.
return;

function roots = BiSectionSearch( xStart, xStop, xStep, xOverlap, Function )
%
% Function that uses bisection to search for the roots of f(x)
% Inputs: xStart and xStep - the end points of the search.
%         xStep – the size of interval used in search.
%         xOverlap – the overlap between intervals.
%         Function – the function to be searched.
% Outputs: roots - array of roots found in the search.
%

roots = []; % Create an empty array for roots

% First interval
x0 = xStart;
x1 = x0 + xStep;
xNext = x1-xOverlap;

while x0 < xStop
    x = BiSection( x0, x1, Function); % Call BiSection function

    if length( x ) > 0 % if x returns a number
        roots = [ roots, x( end ) ]; % Save the last number as a root
        end % End of if statement

    % Move to the next interval
    x0 = xNext;
    x1 = x0 + xStep;
    xNext = x1 - xOverlap;

end % End of while loop

end % End of function

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

y = zeros( size ( x ) ); %
yOld = ones( size( x ) ); %

% Defines range of Taylors Series (0 < x < 2)
while x >= 2
    x = x / 2;
    y = y + LogConst;
    end

for k = 1 : MaxTerms % From k = 1 to MaxTerms
yOld = y; %
y = y + ( ( ( -1 )^( k + 1 ) )*( ( x - 1 )^k ) / k );
terms = terms + 1; % Increment Terms variable

if y == yOld
    break;
    end % End if loop
end % End while loop.

return;

function [y,terms] = NR_log1( x, MaxTerms )
%
% [y,terms] = NR_log1(x, MaxTerms )
%
% Computes log of the number x, using a MaxTerms terms.
%
% Input: x – Number that we want the natural log of.
% MaxTerms – The maximum number of terms that are to be used.
% [default: 1000]
% Output: y – log of x
% terms – number of terms used.
%