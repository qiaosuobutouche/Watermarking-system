close  all
I = imread('ԭʼͼ��.bmp');    %��ȡ����ͼ��
erzhitu;
Logistic1;
W = imread('mark.bmp');    %��ȡˮӡͼ��

rngseed=rng('default');     %��Կ2�����������
flag = 1;
[Iw,psnr,k1,k2]=DCTsetwatermark(I,W,rngseed,flag);    %ˮӡǶ��
k1;
k2;
ImageB = imread ('�Ѽ���ˮӡ.bmp');
ImageA = double(I);

[Wg,nc]=DCTgetdwtwatermark(Iw,W,rngseed,flag,k1,k2);      %ˮӡ��ȡ
Logistic2;


disp(['PSNR=',num2str(psnr)]);
disp(['δ�ܵ�����ʱNCֵ=',num2str(nc)]);

action={'�˲�','����','����','�и�','��ת'};      %ˮӡ����
for i=1:numel(action)
   DCTwatermarkattack(action{i},Iw,W,rngseed,k1,k2);
end