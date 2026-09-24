% log
MaxError = 0; % Start error off as 0.
FailConverge = 0; % Start fail to converge to 0
tic % start timer

% Loop x through test values
for x = 1:0.1:100000
    y = log( x ); % Testing built in function
    error = abs( exp( y )-x )/x; % Compute local error
    if MaxError < error 
        MaxError = error;
    end % of max error check
end % of loop through test values

% Print
toc % Stop timer and print time
MaxError 
FailConverge 

% TS_log
MaxError = 0; % Reset Error
FailConverge = 0; % Reset FailConverge count
tic % start timer

% Loop x through test values.
for x = 1:0.1:100000
    [y, terms] = TS_log( x ); % Taylor Series
    error = abs( exp( y )-x )/x; % Compute local error
    if MaxError < error 
        MaxError = error;
    end % of max error check
    if terms == 1000
        FailConverge = FailConverge + 1;
    end % of convergence check
end % of loop through test values

% Print
toc % Stop timer and print time
MaxError 
FailConverge 

% NR_log1
MaxError = 0; % Reset Error
FailConverge = 0; % Reset FailConverge count
tic % start timer

% Loop x through test values
for x = 1:0.1:100000
    [y, terms] = NR_log1( x ); % Newton Raphson 1
    error = abs( exp( y )-x )/ x; % Compute error
    if MaxError < error 
        MaxError = error;
    end % of max error check
    if terms == 1000
        FailConverge = FailConverge + 1;
    end % of convergence check
end % of loop through test values

% Print
toc % Stop timer and print time
MaxError 
FailConverge 

%NR_log2
MaxError = 0; % Reset Error
FailConverge = 0; % Reset FailConverge count
tic % start timer

% Loop x through test values
for x = 1:0.1:100000
    [y, terms] = NR_log2( x ); % Newton Raphson 2
    error = abs( exp( y )-x )/x; % Compute local error
    if MaxError < error 
        MaxError = error;
    end % of max error check
    if terms == 1000
        FailConverge = FailConverge + 1;
    end % of convergence check.
end % of loop through test values

%Print
toc % Stop timer and print time
MaxError 
FailConverge 