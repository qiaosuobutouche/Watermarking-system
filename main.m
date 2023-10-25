close  all
I = imread('原始图像.bmp');    %读取载体图像
erzhitu;
Logistic1;
W = imread('mark.bmp');    %读取水印图像

rngseed=rng('default');     %密钥2，随机数种子
flag = 1;
[Iw,psnr,k1,k2]=DCTsetwatermark(I,W,rngseed,flag);    %水印嵌入
k1;
k2;
ImageB = imread ('已加入水印.bmp');
ImageA = double(I);

[Wg,nc]=DCTgetdwtwatermark(Iw,W,rngseed,flag,k1,k2);      %水印提取
Logistic2;


disp(['PSNR=',num2str(psnr)]);
disp(['未受到攻击时NC值=',num2str(nc)]);

action={'滤波','缩放','噪声','切割','旋转'};      %水印攻击
for i=1:numel(action)
   DCTwatermarkattack(action{i},Iw,W,rngseed,k1,k2);
end