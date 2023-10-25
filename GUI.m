function varargout = GUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end 

function GUI_OpeningFcn(hObject, ~, handles, varargin)

handles.output = hObject;

set(handles.axes1,'visible','off')%坐标系取消
guidata(hObject, handles);

function varargout = GUI_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;


function pushbutton1_Callback(~, ~, handles) %二值化按钮


axes(handles.axes1); %指定坐标轴
I = imread('mark2.bmp'); %读入图像
imshow(I); %显示图像

function axes1_ButtonDownFcn(hObject, eventdata, handles)


function pushbutton3_Callback(hObject, eventdata, handles) %Logistic按钮
axes(handles.axes1); %指定坐标轴
I = imread('mark.bmp'); %读入图像
imshow(I); %显示图像

function pushbutton6_Callback(hObject, eventdata, handles)%提取水印按钮
axes(handles.axes1); %指定坐标轴
I = imread('mark3.bmp'); %读入图像
imshow(I); %显示图像

function pushbutton8_Callback(hObject, eventdata, handles)%Arnold置换按钮

axes(handles.axes1); %指定坐标轴
I = imread('已Arnold置乱水印.bmp'); %读入图像
imshow(I); %显示图像

function pushbutton10_Callback(hObject, eventdata, handles)%关闭界面按钮
close all;


function pushbutton14_Callback(hObject, eventdata, handles)%逆Arnold置换按钮
axes(handles.axes1); %指定坐标轴
I = imread('getmark6.bmp'); %读入图像
imshow(I); %显示图像

function pushbutton15_Callback(hObject, eventdata, handles)%Logistic解密按钮
axes(handles.axes1); %指定坐标轴
I = imread('logistic解密后的水印图像.bmp'); %读入图像
imshow(I); %显示图像


function pushbutton16_Callback(hObject, eventdata, handles)%嵌入水印按钮
axes(handles.axes1); %指定坐标轴
I = imread('已加入水印.bmp'); %读入图像
imshow(I); %显示图像

function pushbutton26_Callback(hObject, eventdata, handles)%杂凑值提取按钮
open('C:\Users\DELL\Desktop\xiugai\test.exe')   


function pushbutton27_Callback(hObject, eventdata, handles)%杂凑值提取按钮
open('C:\Users\DELL\Desktop\xiugai\test.exe')   




function pushbutton1_CreateFcn(hObject, eventdata, handles)%起始函数
I = imread('原始图像.bmp');    %读取载体图像
erzhitu;
Logistic1;
W = imread('mark.bmp');    %读取水印图像
rngseed=rng('default');     %密钥2，随机数种子
flag = 1;
[Iw,psnr,k1,k2]=setdwtwatermark(I,W,rngseed,flag);    %水印嵌入
k1;
k2;
ImageB = imread ('已加入水印.bmp');
%计算水印图像峰值信噪比
ImageA = double(I);
%dPSNR = psnr(ImageA,ImageB);

[Wg,nc]=getdwtwatermark(Iw,W,rngseed,flag,k1,k2);      %水印提取
Logistic2;

disp(['PSNR=',num2str(psnr)]);
disp(['未受到攻击时NC值=',num2str(nc)]);

action={'滤波','压缩','噪声','切割','旋转'};
for i=1:numel(action)
   dwtwatermarkattack(action{i},Iw,W,rngseed,k1,k2);
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)



        


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
val=get(handles.popupmenu3,'Value');
switch val
    case 1
       axes(handles.axes1); %指定坐标轴
       I = imread('旋转攻击后的图像.bmp'); %读入图像
       imshow(I); %显示图像
    case 2
       axes(handles.axes1); %指定坐标轴
       I = imread('压缩攻击后的图像.bmp'); %读入图像
       imshow(I); %显示图像
    case 3
       axes(handles.axes1); %指定坐标轴
       I = imread('切割攻击后的图像.bmp'); %读入图像
       imshow(I); %显示图像
    case 4
       axes(handles.axes1); %指定坐标轴
       I = imread('滤波攻击后的图像.bmp'); %读入图像
       imshow(I); %显示图像
    case 5  
       axes(handles.axes1); %指定坐标轴
       I = imread('噪声攻击后的图像.bmp'); %读入图像
       imshow(I); %显示图像
end
  


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
eval(['!rename' , ',myfile.txt' , ',zacou.txt']); 

mydat= textread('zacou.txt', ' %s')
set(handles.edit1, 'string', mydat)

function pushbutton29_Callback(hObject, eventdata, handles)

mydat= textread('myfile.txt', ' %s')
set(handles.edit2, 'string', mydat)


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
axes(handles.axes1); %指定坐标轴
I = imread('mark2.bmp'); %读入图像
imshow(I); %显示图像


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
axes(handles.axes1); %指定坐标轴
I = imread('原始图像.bmp'); %读入图像
imshow(I); %显示图像


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
