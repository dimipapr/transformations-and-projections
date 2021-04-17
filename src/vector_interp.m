function value = vector_interp(p1, p2, a, V1, V2, dim)
%VECTOR_INTERP Summary of this function goes here
% input:
%   p1, p2, a  : 1x2 points
%   V1, V2     : 1x3 RGB components of p1, p2
%   dim        : 1 = horizontal interpolation, 2 = vertical interpolation

%output:
%   value:  1x3 RGB components on point a

p = [p1; p2];
V = [V1; V2];
if dim == 1 %horizontal interpolation
    if (p(2,1)-p(1,1)) == 0
        value = V1;
    else
        value = ((abs(a(1)-p(2,1))*V(1,:) + abs(p(1,1)-a(1))*V(2,:)))/abs(p(2,1)-p(1,1));
    end
    
elseif dim == 2
    if (p(2,2)-p(1,2)) == 0
        value = V1;
    else
        value = ((abs(a(2)-p(2,2))*V(1,:) + abs(p(1,2)-a(2))*V(2,:)))/abs(p(2,2)-p(1,2));
    end
else
    error('Input argument "dim" value is invalid. Options: "1" for horizontal, "2" for vertical')
end

