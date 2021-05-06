function res = tangent_plane(level_curve, vars, point)
nab = [diff(level_curve, vars(1)); diff(level_curve, vars(2)); diff(level_curve, vars(3))];
n = subs(nab, vars, point);
res = simplify(dot(n, vars-point));
end

