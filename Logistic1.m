%clear
%clc
%close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('mark2.bmp');  %����ͼ��
[m1,n1]=size(a);
c1=zeros(m1,1);
c2=zeros(1,n1);

%logiticӳ�������������
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

%��󣬲���ð�ݷ��������Ļ�������ֵ��С����������򣬲�����ͬ���Ļ����������ζԸ��Ͼ�����к��н��д�������
%��ÿ�л��Ҽ���
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

%��ÿ�л��Ҽ���
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
%�к������Ҽ���ͼ�����
e1=a;
%figure,imshow(e1);
imwrite(e1,'mark.bmp')
%keyboard;

% % %����ͼ������2500�����ص�
% for i=5:55
%     for j=100:150
%         e1(i,j)=0;
%     end
% end

%����ͼ��