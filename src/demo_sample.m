clc
clear

%% Load data %%
load('hw2.mat');

%% Step 0 -Initial position 
% 0.1 Render object with render_object
I0 = render_object(V,F,C',M,N,H,W,w,cv,ck,cu);

% Save result
imwrite(I0, '0.jpg');

%% Step 0.5 - Create a transformation matrix

%% Step 1 - Translate the transformation matrix by t1
% 1.1 Apply translation
tr_matrix1 = transformation_matrix;
tr_matrix1 = tr_matrix1.translate(t1);
res1 = affine_tramsform(V',tr_matrix1);
V1 = res1';
% 1.2 Render object with render_object
I1 = render_object(V1,F,C',M,N,H,W,w,cv,ck,cu);
% Save result
imwrite(I1, '1.jpg');

%% Step 2 - Rotate the transformation matrix by theta around given axis
% 2.1 Apply rotation
tr_matrix2 = transformation_matrix;
tr_matrix2=tr_matrix2.rotate(theta,g);
res2 = affine_transform(V1', tr_matrix2);
V2= res2';
% 2.2 Render object with render_object
I2 = render_object(V2,F,C',M,N,H,W,w,cv,ck,cu);
% Save result
imwrite(I2, '2.jpg');

%% Step 3 - Translate the transformation matrix back
% 3.1 Apply translation
tr_matrix3 = transformation_matrix;
tr_matrix3 = tr_matrix3.translate(t2);
res3 = affine_tramsform(V2',tr_matrix3);
V3 = res3';
% 3.2 Render object with render_object
I3 = render_object(V3,F,C',M,N,H,W,w,cv,ck,cu);
% Save result
imwrite(I3, '3.jpg');
