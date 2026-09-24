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