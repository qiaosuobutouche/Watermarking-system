%clear
%clc
%close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('mark2.bmp');  %导入图像
[m1,n1]=size(a);
c1=zeros(m1,1);
c2=zeros(1,n1);

%logitic映射产生混沌序列
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

%最后，采用冒泡法将产生的混沌序列值由小到大进行排序，并利用同样的换序条理依次对复合矩阵的列和行进行打乱排序：
%对每列混乱加密
for f=1:n1-1
    for h=f:n1
        if y1(f)>y1(h)
            k=y1(f);
            y1(f)=y1(h);
            y1(h)=k;
            c1=a(:,f);
            a(:,f)=a(:,h);
            a(:,h)=c1;
        end   
    end
end

%对每行混乱加密
for f=1:m1-1
    g=f;
    for h=g:m1
        if y2(f)>y2(h)
            k=y2(f);
            y2(f)=y2(h);
            y2(h)=k;
            c2=a(f,:);
            a(f,:)=a(h,:);
            a(h,:)=c2;
        end
    end
end
%列和行置乱加密图像输出
e1=a;
%figure,imshow(e1);
imwrite(e1,'mark.bmp')
%keyboard;

% % %加密图像受损2500个像素点
% for i=5:55
%     for j=100:150
%         e1(i,j)=0;
%     end
% end

%解密图像