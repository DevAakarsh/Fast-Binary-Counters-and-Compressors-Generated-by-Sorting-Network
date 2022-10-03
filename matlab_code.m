clc;
close all;

% imdata_cameraman = imread('cameraman.tif');
% imdata_lena = imread('D:\IIIT-B\Semester3\Aakarsh_PE\lena_gray.jpg');
% 
% fid1 = fopen('D:\IIIT-B\Semester3\Aakarsh_PE\cameraman.txt','wt');
% fid2 = fopen('D:\IIIT-B\Semester3\Aakarsh_PE\lena.txt','wt');

% for i = 1:256
%    for j = 1:256
%        fprintf(fid1,'%d\n', imdata_cameraman(i,j));
%        fprintf(fid2,'%d\n', imdata_lena(i,j));
%    end
% end
% 
% fclose(fid1);
% fclose(fid2);

filename1 = 'D:\IIIT-B\Semester3\Aakarsh_PE\output_alpha_0.1.xlsx';
filename2 = 'D:\IIIT-B\Semester3\Aakarsh_PE\output_alpha_0.2.xlsx';
filename3 = 'D:\IIIT-B\Semester3\Aakarsh_PE\output_alpha_0.3.xlsx';
filename4 = 'D:\IIIT-B\Semester3\Aakarsh_PE\output_alpha_0.4.xlsx';
filename5 = 'D:\IIIT-B\Semester3\Aakarsh_PE\output_alpha_0.5.xlsx';

A1 = readmatrix(filename1)/10;
A2 = readmatrix(filename2)/10;
A3 = readmatrix(filename3)/10;
A4 = readmatrix(filename4)/10;
A5 = readmatrix(filename5)/10;

final_image1 = zeros(256,256);
final_image2 = zeros(256,256);
final_image3 = zeros(256,256);
final_image4 = zeros(256,256);
final_image5 = zeros(256,256);

k = 1;

for i = 1:256 
    for j = 1:256
        final_image1(i,j) = A1(k);
        final_image2(i,j) = A2(k);
        final_image3(i,j) = A3(k);
        final_image4(i,j) = A4(k);
        final_image5(i,j) = A5(k);
        k=k+1;
    end
end

figure

subplot(1,5,1)
imshow(uint8(final_image1))
title("Alpha 0.1");

subplot(1,5,2)
imshow(uint8(final_image2))
title("Alpha 0.2");

subplot(1,5,3)
imshow(uint8(final_image3));
title("Alpha 0.3");

subplot(1,5,4)
imshow(uint8(final_image4));
title("Alpha 0.4");

subplot(1,5,5)
imshow(uint8(final_image5));
title("Alpha 0.5");
