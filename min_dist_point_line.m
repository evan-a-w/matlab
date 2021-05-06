function [dist, M] = min_dist_point_line(point, s_point, dir_vec)
% Returns the distance and the closest point where the vector is s_point +
% t*dir_vec and the point is point.
QP = sym(point - s_point);
QM = proj(QP, dir_vec);
M = QM + s_point;
dist = norm(point-M);
end

