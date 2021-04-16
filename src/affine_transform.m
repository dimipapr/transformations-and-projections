function [cq] = affine_transform(cp,T)
%cp: 3x1 initial point coordinates
%T: transformation_matrix object

%cq: 3x1 transformed point
    cp(4,:)=1;
    cq = zeros(size(cp));
    i=1:size(cp,2);
    cq(:,i)=T.T*cp(:,i);
    cq(4,:)=[];
end

