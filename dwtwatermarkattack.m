function dwtwatermarkattack(action,Iw,W,rngseed,k1,k2)   %ˮӡ����ʵ��
%ģ��ˮӡ����
switch lower(action)
    case '�˲�'
        Ia=imfilter(Iw,ones(3)/9);
    case '����'
        Ia=imresize(Iw,0.2);
        Ia=imresize(Ia,5);
    case '����'
        Ia=imnoise(Iw,'salt & pepper',0.05);
    case '�и�'
        Ia=Iw;
        Ia(1:500,1:500)=randn();
    case '��ת'
        Ia=imrotate(Iw,10,'nearest','crop');
        Ia=imrotate(Ia,-10,'nearest','crop');
        
end
imwrite(Ia,[action '�������ͼ��.bmp']);
%�����ܹ�����ͼ������ȡ��ˮӡ
[Wg1,nc]=attgetdwtwatermark(Ia,W,rngseed,flag,k1,k2);
imwrite(Wg1,[action '�������ˮӡ.bmp']);

%��ʾ����ǰ��ıȽϽ��
%figure('Name',['����ˮӡ ',upper(action),' ��������'],'Position',[287,108,943,557]);
%%subplot(141)
%imshow(Iw)
%title('Ƕ��ˮӡͼ��')
%subplot(142)
%imshow(Ia)
%title(['���� ',upper(action), ' ����'])
%subplot(143)
%imshow(W)
%title('ԭʼˮӡͼ��')
%subplot(144)
%imshow(Wg1)
disp(['�������NCֵ=',num2str(nc),'(����Ϊ�˲������š��������и��ת)']);