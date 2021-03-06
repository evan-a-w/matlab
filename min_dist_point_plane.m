function [dist, n] = min_dist_point_plane(point, s_point, dir_vec1, dir_vec2)
% Returns the distance and the closest point where the plane is s_point +
% t*dir_vec1 + s*dir_vec2 and the point is point.
n = cross(sym(dir_vec1), dir_vec2);
QP = point - s_point;
dist = norm(proj(QP, n));
end

