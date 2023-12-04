## 基于DWT和DCT的鲁棒图像水印系统

#### 本项目实现的功能

- 预处理算法

  - Arnold置乱算法

  - Logistics混沌序列算法

- DWT加密及解密算法

- DCT加密及解密算法

- 抗鲁棒攻击系统

- 嵌入提取界面

- 抗鲁棒攻击界面

- 评价指标 PSNR,NC 评价算法的鲁棒性 

#### 项目介绍

1. 利用 Logistic 算法对二进制水印进行加密，产生的混沌序列具有较好的不确定性和初值敏感性。
2. 对加密后的水印图像进行 Arnold 变换，消除水印像素之间的相关性，从而提高图像信息的鲁棒性。
3. 在嵌入过程中，对原始图像进行二级小波分解，然后对低频子带 LL1 进行分块，增强水印的鲁棒性。
4. 通过 DCT 变换修改中频系数，嵌入预处理后的水印信息，兼顾了鲁棒性和不可见性。
5. 该算法进行了抗鲁棒攻击仿真实验，在受到各种恶意攻击时具有良好的隐蔽性和鲁棒性。
6. 本项目编写了水印系统界面，GUI为本算法提取嵌入水印的界面，包括 Logistic 混沌序列加密、Arnold 变换、融合DWT及DCT的嵌入与提取算法。GUI1为本算法遭到五种攻击后提取水印的界面，其中包括滤波攻击、噪声攻击、缩放攻击、旋转攻击、剪切攻击。其中滤波攻击后提取效果过于良好，因此未在项目中展示，而使用0.05噪声攻击替代之。

#### 评价指标

|                      Type of attack                       |                          No attack                           |            Salt & Peppernoise (coefficient 0.05)             |             Salt & Peppernoise (coefficient 0.1)             |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                  Images after the attack                  | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E5%B7%B2%E5%8A%A0%E5%85%A5%E6%B0%B4%E5%8D%B0.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/0.05%E5%99%AA%E5%A3%B0%E6%94%BB%E5%87%BB%E5%90%8E%E7%9A%84%E5%9B%BE%E5%83%8F.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/0.1%E5%99%AA%E5%A3%B0%E6%94%BB%E5%87%BB%E5%90%8E%E7%9A%84%E5%9B%BE%E5%83%8F.bmp) |
| The watermark extracted using the algorithm in this paper | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E6%9C%AA%E5%8F%97%E6%94%BB%E5%87%BB%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/0.05%E5%99%AA%E5%A3%B0%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/0.1%E5%99%AA%E5%A3%B0%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0.bmp) |
|       Watermark extracted using DCT algorithm only        | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E6%9C%AA%E5%8F%97%E6%94%BB%E5%87%BB%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0DCT.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/0.05%E5%99%AA%E5%A3%B0%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0DCT.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/0.1%E5%99%AA%E5%A3%B0%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0DCT.bmp) |
|        NC values using the algorithm of this paper        |                           0.99986                            |                           0.99844                            |                           0.99447                            |
|          NC values using only the DCT algorithm           |                              1                               |                           0.99688                            |                           0.98762                            |
|                      Type of attack                       |                       Zoom image (2x)                        |                  Rotate image (10 degrees)                   |                      Crop image (1/16)                       |
|                  Images after the attack                  | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/2%E5%80%8D%E7%BC%A9%E6%94%BE%E6%94%BB%E5%87%BB%E5%90%8E%E7%9A%84%E5%9B%BE%E5%83%8F.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E6%97%8B%E8%BD%AC%E6%94%BB%E5%87%BB%E5%90%8E%E7%9A%84%E5%9B%BE%E5%83%8F.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E5%88%87%E5%89%B2%E6%94%BB%E5%87%BB%E5%90%8E%E7%9A%84%E5%9B%BE%E5%83%8F.bmp) |
| The watermark extracted using the algorithm in this paper | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/2%E5%80%8D%E7%BC%A9%E6%94%BE%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E6%97%8B%E8%BD%AC%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E5%88%87%E5%89%B2%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0.bmp) |
|       Watermark extracted using DCT algorithm only        | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/2%E5%80%8D%E7%BC%A9%E6%94%BE%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0DCT.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E6%97%8B%E8%BD%AC%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0DCT.bmp) | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E5%88%87%E5%89%B2%E6%94%BB%E5%87%BB%E5%90%8E%E6%8F%90%E5%8F%96%E7%9A%84%E6%B0%B4%E5%8D%B0DCT.bmp) |
|        NC values using the algorithm of this paper        |                           0.99943                            |                           0.97025                            |                           0.96923                            |
|          NC values using only the DCT algorithm           |                           0.91291                            |                            0.8819                            |                           0.21482                            |

#### 引用
这篇文章被使用于本项目中，你可以引用在自己的论文里
```
@inproceedings{10.1117/12.2657074,
	author = {Shuo-Kun Yang and De-Zhi Sun and Fu-Cheng You and Ji-Qiang Dong},
	title = {Robust image watermarking algorithm based on DWT and DCT},
	year = {2022},
	doi = {10.1117/12.2657074},
	URL = {https://doi.org/10.1117/12.2657074}
}
```

