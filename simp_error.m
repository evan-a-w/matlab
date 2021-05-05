% Simpson's error.
% This returns the error function error_n.
%If max_error is not 0, the function will return the smallest n such that
%the max error is less than or equal to max_error.
function [error_n, smallest_n] = simp_error(func, var, a, b, max_error)
    syms n
    der4 = diff(func,var,4);
    try
        K = max(abs([subs(func, var, solve(diff(der4,var)==0, var)) subs(der4, var, a) subs(der4, var, b)]));
    catch
        K = max(abs(subs(der4,var,a)),abs(subs(der4,var,b)));
    end
    error_n = K*(b-a)^5/(2880*n^4);
    if max_error ~= 0
        sols = solve(error_n==max_error, n);
        smallest_n = ceil(vpa(sols(real(sols)>0&imag(sols)==0)));
    else
        smallest_n = 0;
    end
    error_n = matlabFunction(error_n);
end