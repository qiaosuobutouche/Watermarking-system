function [Iw,psnr,k1,k2]=DCTsetwatermark(I,W,rngseed,flag)    %С��ˮӡǶ��
type=class(I);  %��������
I=double(I);    %ǿ������ת��Ϊdouble
W=logical(W);    %ǿ������ת��Ϊlogical
[mI,nI]=size(I);  %����I������ֵ��mIΪ�У�nIΪ��
[mW,nW]=size(W);
if mW~=nW      %����Arnold����ֻ��ui����ͼ����д���
    error('SETDWTWATERMARK:ARNOLD','ARNOLD����Ҫ��ˮӡͼ�񳤿������ȣ�')
end



%��ˮӡͼ�����Ԥ����
%��ʼ����������
Wa=W;
% %��ˮӡ����Arnold�任
ntimes = 24;
 H=[1,1;1,2]^ntimes;     
 for i=1:nW
     for j=1:nW
         idx=mod(H*[i-1;j-1],nW)+1;
         Wa(idx(1),idx(2))=W(i,j);
     end
 end
 
 if flag
     imwrite(Wa,'��Arnold����ˮӡ.bmp');
 end
 
%С������ˮӡ��Ƕ��
%��ʼ��Ƕ��ˮӡ��ca2ϵ��
IW=I;
%��ca2�����ѡ��mW*nW��ϵ��
rng(rngseed);
idx=randperm(numel(IW),numel(Wa));
% ��ˮӡ��ϢǶ�뵽ca2��
Wa = imread('��Arnold����ˮӡ.bmp');

mark = Wa;
alpha=60;          %Ƕ��ǿ�ȣ���������������������������������������������������������������������������

k1=randn(1,8);
k2=randn(1,8);

dimI=size(Wa);
rm=dimI(1);cm=dimI(2);

[r,c]=size(I);
cda0=blkproc(I,[8,8],'dct2');

%%%%%%%%%%%%%%%%%%Ƕ�� %%%%%%%%%%
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

%%%%% Ƕ��ˮӡ��ͼ�� %%%%%%%%%%%%%%
Iw=blkproc(cda1,[8,8],'idct2');

%����ˮӡͼ���ֵ�����
mn=numel(I);
Imax=max(I(:));
psnr=10*log10(mn*Imax^2/sum((I(:)-Iw(:)).^2));

%���Ƕ��ˮӡͼ�������
I=cast(I,type);
Iw=cast(Iw,type);
if flag
    imwrite(Iw,'�Ѽ���ˮӡ.bmp');
end

