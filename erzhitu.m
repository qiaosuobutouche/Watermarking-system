A=imread('ˮӡ.bmp');   %��ȡ��һ��ͼƬ   
%thresh = graythresh(A);     %�Զ�ȷ����ֵ����ֵ
I2 = im2bw(A,120/255); %��ͼ���ֵ��
%figure();
%subplot(1,2,1);  imshow(A);  title('ԭͼ');   %��ʾ��ֵ��֮ǰ��ͼƬ
%subplot(1,2,2);  imshow(I2);  title('��ֵ��');  %��ʾ��ֵ��֮���ͼƬ
imwrite(I2,'mark2.bmp')