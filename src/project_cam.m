function [P, D] = project_cam(w, cv, cx, cy, cz, p)
    %p: 3x1 point (3xN)
    %cv: 3x1 cam center
    %cx, cy, cz: 3x1 cam axis
    %w: apostasi petasmatos
    P = zeros(2,size(p,2));
    D = zeros(size(p,2));
    
    t = transformation_matrix;
    t.T(1:3,1:4)=[cx cy cz cv];
    for i=1:size(p,2)
        pn = affine_transform(p(:,i),t.T);
        P(i)=pn(1:2)*w/pn(3);
        D(i)=pn(3);
    end
    

end

