function [Prast] = rasterize(P,M,N,H,W)
% P: 2xN
%from (float)[-H/2:H/2,-W/2:W/2] to (int)[1:M,1:N]
Prast = zeros(size(P));
Prast(1,:) = floor((P(1,:)+H/2)*M/H+1);
Prast(2,:) = floor((P(2,:)+W/2)*N/W+1);

end
