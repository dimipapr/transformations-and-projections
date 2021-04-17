function [Img] = render(vertices_2d, faces, vertex_colors, depth, renderer)
%RENDERER 
%   input:
%       vertices_2d: Lx2,(x,y) coordinates of L vertices
%       faces: Kx3, the 3 vertices of K triangles, referring to vertices_2d
%       vertex_colors: Lx3, RGB components of each vertex
%       renderer: (Flat, Gouraud)

m = size(faces,1);
Img = ones(1200,1200,3);
%calculate depth for each face
face_depth = zeros(size(faces,1),1);
for i=1:size(faces,1)
   face_depth(i) = (depth(faces(i,1))+depth(faces(i,2))+depth(faces(i,3)))/3; 
end
%sort faces by depth (descending)
[~,idx] = sort(face_depth,'descend');
faces = faces(idx,:);
if strcmp(renderer, 'flat')
    for i=1:m
        v_2d = [vertices_2d(faces(i,1),:) ;vertices_2d(faces(i,2),:) ;vertices_2d(faces(i,3),:)];
        v_c = [vertex_colors(faces(i,1),:) ;vertex_colors(faces(i,2),:); vertex_colors(faces(i,3),:)];
        Img = paint_triangle_flat(Img, v_2d, v_c);
        if mod(i,1000)==0

            waitbar(i/m)
           

        end
    end
elseif strcmp(renderer, 'gouraud')
    for i=1:m
        v_2d = [vertices_2d(faces(i,1),:) ;vertices_2d(faces(i,2),:) ;vertices_2d(faces(i,3),:)];
        v_c = [vertex_colors(faces(i,1),:) ;vertex_colors(faces(i,2),:); vertex_colors(faces(i,3),:)];
        Img = paint_triangle_gouraud(Img, v_2d, v_c);
        if mod(i,1000)==0

            waitbar(i/m)
            imshow(Img)

        end
    end
else
    error('incorect renderer argument. Options: flat | gouraud')
end
