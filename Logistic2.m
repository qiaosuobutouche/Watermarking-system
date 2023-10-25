%logitic映射产生混沌序列
e1=imread('getmark6.bmp');
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

%b1，b2矩阵分别是为了构造图像矩阵的列和行的编号的一个等差数列
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

%对每行混乱解密
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

%对每列混乱解密
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
d1=e1;
%figure('name','logistic解密后'),imshow(d1);title('logistic解密后的水印图像');
imwrite(d1,'logistic解密后的水印图像.bmp')


