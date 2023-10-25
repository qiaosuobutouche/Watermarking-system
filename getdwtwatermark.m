function [Wg,nc]=getdwtwatermark(Iw,W,rngseed,flag,k1,k2)  %小波水印提取
[mW,nW]=size(W);
if mW~=nW
    error('GETDWTWATERMARK:ARNOLD','ARNOLD置乱要求水印图像长宽必须相等！')
end
Iw=double(Iw);
W=logical(W);
ca1w=dwt2(Iw,'haar');
ca2w=dwt2(ca1w,'haar');
Wa=W;
rng(rngseed);
%idx=randperm(numel(ca2w),numel(Wa));
%for i=1:numel(Wa)
 %   c=ca2w(idx(i));
  %  z=mod(c,nW);
  %  if z<nW/2
  %      Wa(i)=0;
  %  else
  %      Wa(i)=1;
  %  end
%end

%%%%%%%%%%%%%%%%   提取水印  %%%%%
shuiyin = imread('已Arnold置乱水印.bmp');
dimI=size(shuiyin);
%rm=dimI(1);cm=dimI(2);

M1 = ca2w;
psnr_watermarked=M1;

% [LL1,ch1,cv1,cd1]=dwt2(M1,'haar');
% [LL2,ch2,cv2,cd2]=dwt2(LL1,'haar');

dca1=blkproc(M1,[8,8],'dct2');
p=zeros(1,8);
for i=1:dimI(1)
for j=1:dimI(2)  % j=1:32
x=(i-1)*8;y=(j-1)*8;
p(1)=dca1(x+1,y+8);
p(2)=dca1(x+2,y+7);
p(3)=dca1(x+3,y+6);
p(4)=dca1(x+4,y+5);
p(5)=dca1(x+5,y+4);
p(6)=dca1(x+6,y+3);
p(7)=dca1(x+7,y+2);
p(8)=dca1(x+8,y+1);
if corr2(p,k1)>corr2(p,k2),warning off MATLAB:divideByZero;
mark1(i,j)=1;
else
mark1(i,j)=0;
end
end
end

Wg=Wa;
Wa=mark1;
% H=[2 -1;-1,1]^ntimes;
% for i=1:nW
%     for j=1:nW
%         idx=mod(H*[i-1;j-1],nW)+1;
%         Wg(idx(1),idx(2))=Wa(i,j);
%     end
% end
%提取和原始水印相关系数的计算
ntimes = 24;
 H=[1,1;1,2]^ntimes;     
 for i=1:nW
     for j=1:nW
         idx=mod(H*[i-1;j-1],nW)+1;
         Wg(idx(1),idx(2))=Wa(i,j);
     end
 end
 
 if flag
    % figure('Name','水印置乱效果')
    % subplot(121)
    % imshow(Wa)
    % title('提取水印') 
    % subplot(122)
    % imshow(Wg)
    imwrite(Wa,'mark3.bmp')
    % title(['置乱水印，变换次数=',num2str(ntimes)]);
 end
 
nc=sum(Wg(:).*W(:))/sqrt(sum(Wg(:).^2))/sqrt(sum(W(:).^2));

if flag
    %figure('Name','数字水印提取结果')
    %subplot(121)
    %imshow(W)
    %title('原始水印')
    %subplot(122)
    %imshow(Wg)
    %title(['提取且解密后水印，NC=',num2str(nc)]);
    imwrite(Wg,'getmark6.bmp')
end