function vec = proj(v, pro)
p = sym(pro);
vec = dot(v, p)/dot(p,p) * p;
end

