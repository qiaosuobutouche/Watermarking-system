Q=0:100;
PSNR=zeros(1,101); %psnrֵ

for i=1:101     %����ÿ���������Ӷ�Ӧ��JPEGѹ��������¼PSNRֵ
   img= imread('ԭʼͼ��.bmp');
   imwrite(img,"lena256.bmp","quality",Q(i));%imwrite����ֱ��JPEGѹ����Q(i)Ϊ��������
   jpeg= imread('lena256.bmp');

end
