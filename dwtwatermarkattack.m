function dwtwatermarkattack(action,Iw,W,rngseed,k1,k2)   %水印攻击实验
%模拟水印攻击
switch lower(action)
    case '滤波'
        Ia=imfilter(Iw,ones(3)/9);
    case '缩放'
        Ia=imresize(Iw,0.2);
        Ia=imresize(Ia,5);
    case '噪声'
        Ia=imnoise(Iw,'salt & pepper',0.05);
    case '切割'
        Ia=Iw;
        Ia(1:500,1:500)=randn();
    case '旋转'
        Ia=imrotate(Iw,10,'nearest','crop');
        Ia=imrotate(Ia,-10,'nearest','crop');
        
end
imwrite(Ia,[action '攻击后的图像.bmp']);
%从遭受攻击的图像中提取出水印
[Wg1,nc]=attgetdwtwatermark(Ia,W,rngseed,flag,k1,k2);
imwrite(Wg1,[action '攻击后的水印.bmp']);

%显示攻击前后的比较结果
%figure('Name',['数字水印 ',upper(action),' 攻击试验'],'Position',[287,108,943,557]);
%%subplot(141)
%imshow(Iw)
%title('嵌入水印图像')
%subplot(142)
%imshow(Ia)
%title(['遭受 ',upper(action), ' 攻击'])
%subplot(143)
%imshow(W)
%title('原始水印图像')
%subplot(144)
%imshow(Wg1)
disp(['攻击后的NC值=',num2str(nc),'(依次为滤波、缩放、噪声、切割、旋转)']);