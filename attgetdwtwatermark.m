function [Wg1,nc]=attgetdwtwatermark(Ia,W,rngseed,flag,k1,k2)  %���ܹ������С��ˮӡ��ȡ
[mW,nW]=size(W);
if mW~=nW
    error('GETDWTWATERMARK:ARNOLD','ARNOLD����Ҫ��ˮӡͼ�񳤿������ȣ�')
end
Iw=double(Ia);
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

%%%%%%%%%%%%%%%%   ��ȡˮӡ  %%%%%
shuiyin = imread('��Arnold����ˮӡ.bmp');
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

% end
%��ȡ��ԭʼˮӡ���ϵ���ļ���
ntimes = 24;
 H=[1,1;1,2]^ntimes;     
 for i=1:nW
     for j=1:nW
         idx=mod(H*[i-1;j-1],nW)+1;
         Wg(idx(1),idx(2))=Wa(i,j);
     end
 end
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %logiticӳ�������������
e1=Wg;
[m1,n1]=size(e1);
q=3.9;
x(1)=0.3001;
for n=1:n1+m1+100
    x(n+1)=q*x(n)*(1-x(n));
end
for n=101:1:n1+100
y1(n-100)=x(n);
end
for n=101:1:m1+100
y2(n-100)=x(n);
end

%b1��b2����ֱ���Ϊ�˹���ͼ�������к��еı�ŵ�һ���Ȳ�����
b1=zeros(1,n1);
b2=zeros(1,m1);
for e=1:n1
    b1(1,e)=e;
end
for e=1:m1
     b2(1,e)=e; 
end
%b1
for f=1:n1-1
    for h=f:n1
        if y1(f)>y1(h)
            k=y1(f);
            y1(f)=y1(h);
            y1(h)=k;
            t=b1(f);
            b1(f)=b1(h);
            b1(h)=t;
        end   
    end
end

%b2
for f=1:m1-1
    g=f;
    for h=g:m1
        if y2(f)>y2(h)
            k=y2(f);
            y2(f)=y2(h);
            y2(h)=k;
            t=b2(f);
            b2(f)=b2(h);
            b2(h)=t;
        end
    end
end

%��ÿ�л��ҽ���
for f=1:m1-1
    g=f;
    for h=g:m1
        if b2(f)>b2(h)
            k=b2(f);
            b2(f)=b2(h);
            b2(h)=k;
            c2=e1(f,:);
            e1(f,:)=e1(h,:);
            e1(h,:)=c2;
          
        end
    end
end

%��ÿ�л��ҽ���
for f=1:n1-1
    for h=f:n1
        if b1(f)>b1(h)
            k=b1(f);
            b1(f)=b1(h);
            b1(h)=k;
            c1=e1(:,f);
            e1(:,f)=e1(:,h);
            e1(:,h)=c1;
        end   
    end
end
Wg1=e1;
 
 if flag
 
 end
 
nc=sum(Wg(:).*W(:))/sqrt(sum(Wg(:).^2))/sqrt(sum(W(:).^2));
if flag

    imwrite(Wg,'getmark6.bmp')
end

