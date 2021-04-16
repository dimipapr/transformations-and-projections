classdef transformation_matrix
    %FORMATION_MATRIX Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        T
    end
    
    methods
        function obj = transformation_matrix()
            %FORMATION_MATRIX Construct an instance of this class
            %   Detailed explanation goes here
            obj.T = eye(4);
        end        
        function obj=rotate(obj, theta, u)
            %theta: angle (radians)
            %u : 3x1 axis of rotation vector (unitary?)
            
            %Using Rodrigues formula to get the rotation matrix
            R = (1-cos(theta))*[u(1)*u(1) u(1)*u(2) u(1)*u(3);u(2)*u(1) u(2)*u(2) u(2)*u(3);u(3)*u(1) u(3)*u(2) u(3)*u(3)];
            R = R + cos(theta)*eye(3);
            R = R + sin(theta)*[0 -u(3) u(2); u(3) 0 -u(1); -u(2) u(1) 0];
            obj.T(1:3,1:3)=R;
            
            
        end
        function obj=translate(obj, t)
            %t : 3x1 vector
            
            obj.T(1:3,4)=t;
        end
        
    end
end

