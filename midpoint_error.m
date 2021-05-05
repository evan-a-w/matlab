% Midpoint error.
% This returns the error function error_n.
%If max_error is not 0, the function will return the smallest n such that
%the max error is less than or equal to max_error.
function [error_n, smallest_n] = midpoint_error(func, var, a, b, max_error)
    syms n
    der2 = diff(func,var,2);
    try
        K = max(abs([subs(func, var, solve(diff(der2,var)==0, var)) subs(der2, var, a) subs(der2, var, b)]));
    catch
        K = max(abs(subs(der2,var,a)),abs(subs(der2,var,b)));
    end
    error_n = K*(b-a)^3/(24*n^2);
    if max_error ~= 0
        sols = solve(error_n==max_error, n);
        smallest_n = ceil(vpa(sols(real(sols)>0&imag(sols)==0)));
    else
        smallest_n = 0;
    end
    error_n = matlabFunction(error_n);
end