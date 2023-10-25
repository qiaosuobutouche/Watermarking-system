function dPSNR = psnr(ImageA,ImageB)

if (size(ImageA,1) ~= size(ImageB,1)) or (size(ImageA,2) ~= size(ImageB,2))
    error('ImageA <> ImageB');
    dPSNR = 0;
    return ;
end

M = size(ImageA,1);
N = size(ImageA,2);
    
d = 0 ;
for i = 1:M
    for j = 1:N
        d = d + (ImageA(i,j) - ImageB(i,j)).^2 ;
    end
end
    
dPSNR = -10*log10(d/(255*255*M*N)) ;

return

