function [Y] = paint_triangle_flat(img, vertices_2d, vertex_colors)
%input : 
% img : MxNx3 canvas
% vertices_2d: 3x2 vertex coordinates
% vertex_colors : 3x3 vertex RGB components (per line)

%output :
% Y : MxNx3 the input image with a new triangle on top

Y = img;

%sort by Y coordinate, brake ties by x coordinate
[v_2d,idx] = sortrows(vertices_2d,[2 1]);
v_c = vertex_colors(idx,:);
invm = [(v_2d(2,1)-v_2d(1,1))/(v_2d(2,2)-v_2d(1,2));
    (v_2d(3,1)-v_2d(1,1))/(v_2d(3,2)-v_2d(1,2));
    (v_2d(3,1)-v_2d(2,1))/(v_2d(3,2)-v_2d(2,2))];
x1 = v_2d(1,1);
x2 = x1;
invm1 = invm(1);
invm2 = invm(2);
active_sides = [1 2;1 3];
for y = v_2d(1,2):v_2d(3,2)
    if y == v_2d(2,2)
        if y == v_2d(1,2)% top flat case
            active_sides = [1 3; 2 3];
        else
            active_sides = [2 3; 1 3];
        end
        x1 = v_2d(2,1);
        invm1 = invm(3);
        if y == v_2d(3,2) % bottom flat case or y == ymax
            active_sides = [2 3; 1 3];
            x2 = v_2d(3,1);
            if y == v_2d(1,2) % straight line case
                active_sides = [1 3; 1 3];
                x1 = v_2d(1,1);
            end
        end
    end
    indX1 = round(x1);
    indX2 = round(x2);
    C1 = vector_interp(v_2d(active_sides(1,1),:),v_2d(active_sides(1,2),:), [x1, y], v_c(active_sides(1,1),:), v_c(active_sides(1,2),:), 2);
    C2 = vector_interp(v_2d(active_sides(2,1),:),v_2d(active_sides(2,2),:), [x2, y], v_c(active_sides(2,1),:), v_c(active_sides(2,2),:), 2);
    step = 1;
    if indX2<indX1
        step = -1;
    end
    for x=indX1:step:indX2
        Y(x,y,:)= vector_interp([indX1 y], [indX2 y], [x y], C1, C2, 1);
    end
    x1 = x1+invm1;
    x2 = x2+invm2;
   
end
    
end

