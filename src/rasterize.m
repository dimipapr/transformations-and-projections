function [Prast] = rasterize(P,M,N,H,W)

%from (float)[-H/2:H/2,-W/2:W/2] to (int)[1:M,1:N]

Prast(:,1) = floor((P(:,1)+H/2)/H*M+1);
Prast(:,2) = floor((P(:,2)+W/2)/W*N+1);

end
