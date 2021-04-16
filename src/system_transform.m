function dp = system_transform(cp,T)
    %cp: 3x1 point (3xN)
    %T: transformation_matrix object describing new cs orientation
    %c0: 3x1 point describing rotation axis
    %dp: 3x1 point in new cs (3xN)
    
    cp(4,:)=1;
    dp = zeros(size(cp));
    %calculate points coords in new cs
    for i=1:size(cp,2)
        dp(:,i) = T.T\cp(:,i);
    end
    dp(4,:)=[];
end

