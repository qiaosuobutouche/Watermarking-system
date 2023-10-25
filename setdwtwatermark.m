function [Iw,psnr,k1,k2]=setdwtwatermark(I,W,rngseed,flag)    %小波水印嵌入
type=class(I);  %数据类型
I=double(I);    %强制类型转换为double
W=logical(W);    %强制类型转换为logical
[mI,nI]=size(I);  %返回I的行列值，mI为行，nI为列
[mW,nW]=size(W);
if mW~=nW      %由于Arnold置乱只能ui方正图像进行处理
    error('SETDWTWATERMARK:ARNOLD','ARNOLD置乱要求水印图像长宽必须相等！')
end

%对载体图像进行小波分解
%一级Harr小波分解
%低频，水平，垂直，对角线
[ca1,ch1,cv1,cd1]=dwt2(I,'haar');
%二级小波分解
[ca2,ch2,cv2,cd2]=dwt2(ca1,'haar');


%对水印图像进行预处理
%初始化置乱数组
Wa=W;
% %对水印进行Arnold变换
ntimes = 24;
 H=[1,1;1,2]^ntimes;     
 for i=1:nW
     for j=1:nW
         idx=mod(H*[i-1;j-1],nW)+1;
         Wa(idx(1),idx(2))=W(i,j);
     end
 end
 
 if flag
     imwrite(Wa,'已Arnold置乱水印.bmp');
 end
 
%小波数字水印的嵌入
%初始化嵌入水印的ca2系数
ca2w=ca2;
%从ca2中随机选择mW*nW个系数
rng(rngseed);
idx=randperm(numel(ca2),numel(Wa));
% 将水印信息嵌入到ca2中
Wa = imread('已Arnold置乱水印.bmp');

mark = Wa;
alpha=60;          %嵌入强度！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！

k1=randn(1,8);
k2=randn(1,8);

dimI=size(Wa);
rm=dimI(1);cm=dimI(2);

[r,c]=size(ca2);
cda0=blkproc(ca2,[8,8],'dct2');

%%%%%%%%%%%%%%%%%%嵌入 %%%%%%%%%%
cda1=cda0;  
for i=1:rm  
for j=1:cm  
x=(i-1)*8;y=(j-1)*8;
if mark(i,j)==1
k=k1;
else
k=k2;
end
cda1(x+1,y+8)=cda0(x+1,y+8)+alpha*k(1);
cda1(x+2,y+7)=cda0(x+2,y+7)+alpha*k(2);
cda1(x+3,y+6)=cda0(x+3,y+6)+alpha*k(3);
cda1(x+4,y+5)=cda0(x+4,y+5)+alpha*k(4);
cda1(x+5,y+4)=cda0(x+5,y+4)+alpha*k(5);
cda1(x+6,y+3)=cda0(x+6,y+3)+alpha*k(6);
cda1(x+7,y+2)=cda0(x+7,y+2)+alpha*k(7);
cda1(x+8,y+1)=cda0(x+8,y+1)+alpha*k(8);
end
end

%%%%% 嵌入水印后图像 %%%%%%%%%%%%%%
a1=blkproc(cda1,[8,8],'idct2');

%根据小波系数重构图像
ca2w = a1;
ca1w=idwt2(ca2w,ch2,cv2,cd2,'haar');
Iw=idwt2(ca1w,ch1,cv1,cd1,'haar');
Iw=Iw(1:mI,1:nI);

%计算水印图像峰值信噪比
mn=numel(I);
Imax=max(I(:));
psnr=10*log10(mn*Imax^2/sum((I(:)-Iw(:)).^2));

%输出嵌入水印图像最后结果
I=cast(I,type);
Iw=cast(Iw,type);
if flag
    imwrite(Iw,'已加入水印.bmp');
end

