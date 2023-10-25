## 基于DWT和DCT的鲁棒图像水印算法

#### 本项目实现的功能

- 预处理算法

  - Arnold置乱算法

  - Logistics混沌序列算法

- DWT加密及解密算法

- DCT加密及解密算法

- 抗鲁棒攻击系统

- 嵌入提取界面

- 抗鲁棒攻击界面

#### 项目介绍

1. 利用 Logistic算法对二进制水印进行加密，产生的混沌序列具有较好的不确定性和初值敏感性。
2. 对加密后的水印图像进行 Arnold 变换，消除水印像素之间的相关性，从而提高图像信息的鲁棒性。
3. 在嵌入过程中，对原始图像进行二级小波分解，然后对低频子带 LL1 进行分块，增强水印的鲁棒性。
4. 通过 DCT 变换修改中频系数，嵌入预处理后的水印信息，兼顾了鲁棒性和不可见性。
5. 该算法进行了抗鲁棒攻击仿真实验，在受到各种恶意攻击时具有良好的隐蔽性和鲁棒性。

#### 评价指标

|                      Type of attack                       |                          No attack                           |            Salt & Peppernoise (coefficient 0.05)             |             Salt & Peppernoise (coefficient 0.1)             |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                  Images after the attack                  | ![img](https://raw.githubusercontent.com/qiaosuobutouche/Watermarking-system/main/pic/%E5%8E%9F%E5%A7%8B%E5%9B%BE%E5%83%8F.bmp) | ![img](https://github.com/qiaosuobutouche/Watermarking-system/blob/main/pic/%E5%99%AA%E5%A3%B0%E6%94%BB%E5%) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps3.jpg) |
| The watermark extracted using the algorithm in this paper | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps4.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps5.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps6.jpg) |
|       Watermark extracted using DCT algorithm only        | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps7.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps8.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps9.jpg) |
|        NC values using the algorithm of this paper        |                           0.99986                            |                           0.99844                            |                           0.99447                            |
|          NC values using only the DCT algorithm           |                              1                               |                           0.99688                            |                           0.98762                            |
|                      Type of attack                       |                       Zoom image (2x)                        |                  Rotate image (10 degrees)                   |                      Crop image (1/16)                       |
|                  Images after the attack                  | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps10.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps11.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps12.jpg) |
| The watermark extracted using the algorithm in this paper | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps13.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps14.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps15.jpg) |
|       Watermark extracted using DCT algorithm only        | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps16.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps17.jpg) | ![img](file:///C:\Users\木易\AppData\Local\Temp\ksohtml20900\wps18.jpg) |
|        NC values using the algorithm of this paper        |                           0.99943                            |                           0.97025                            |                           0.96923                            |
|          NC values using only the DCT algorithm           |                           0.91291                            |                            0.8819                            |                           0.21482                            |

#### 引用

```
@inproceedings{10.1117/12.2657074,
	author = {Shuo-Kun Yang and De-Zhi Sun and Fu-Cheng You and Ji-Qiang Dong},
	title = {{Robust image watermarking algorithm based on DWT and DCT}},
	year = {2022},
	doi = {10.1117/12.2657074},
	URL = {https://doi.org/10.1117/12.2657074}
}
```

