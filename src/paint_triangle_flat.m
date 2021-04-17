function [Y] = paint_triangle_flat(img, vertices_2d, vertex_colors)
%input : 
% img : MxNx3 canvas
% vertices_2d: 3x2 vertex coordinates
% vertex_colors : 3x3 vertex RGB components (per line)

%output :
% Y : MxNx3 the input image with a new triangle on top

Y = img;

%sort by Y coordinate, brake ties by x coordinate
v_2d = sortrows(vertices_2d,[2 1]);
triangle_color = sum(vertex_colors,1)/3;
invm = [(v_2d(2,1)-v_2d(1,1))/(v_2d(2,2)-v_2d(1,2));
    (v_2d(3,1)-v_2d(1,1))/(v_2d(3,2)-v_2d(1,2));
    (v_2d(3,1)-v_2d(2,1))/(v_2d(3,2)-v_2d(2,2))];
x1 = v_2d(1,1);
x2 = x1;
invm1 = invm(1);
invm2 = invm(2);
for y = v_2d(1,2):v_2d(3,2)
    if y == v_2d(2,2)
        x1 = v_2d(2,1);
        invm1 = invm(3);
        if y == v_2d(3,2)
            x2 = v_2d(3,1);
            if y == v_2d(1,2)
                x1 = v_2d(1,1);
            end
        end
    end
    indX1 = round(x1);
    indX2 = round(x2);
    for x=min(indX1,indX2):max(indX1,indX2)
        Y(x,y,:)= triangle_color;
    end
    x1 = x1+invm1;
    x2 = x2+invm2;
   
end
    
end

