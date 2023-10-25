Q=0:100;
PSNR=zeros(1,101); %psnr值

for i=1:101     %进行每个质量因子对应的JPEG压缩，并记录PSNR值
   img= imread('原始图像.bmp');
   imwrite(img,"lena256.bmp","quality",Q(i));%imwrite函数直接JPEG压缩，Q(i)为质量因子
   jpeg= imread('lena256.bmp');

end
