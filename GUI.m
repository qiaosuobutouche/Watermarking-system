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

set(handles.axes1,'visible','off')%����ϵȡ��
guidata(hObject, handles);

function varargout = GUI_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;


function pushbutton1_Callback(~, ~, handles) %��ֵ����ť


axes(handles.axes1); %ָ��������
I = imread('mark2.bmp'); %����ͼ��
imshow(I); %��ʾͼ��

function axes1_ButtonDownFcn(hObject, eventdata, handles)


function pushbutton3_Callback(hObject, eventdata, handles) %Logistic��ť
axes(handles.axes1); %ָ��������
I = imread('mark.bmp'); %����ͼ��
imshow(I); %��ʾͼ��

function pushbutton6_Callback(hObject, eventdata, handles)%��ȡˮӡ��ť
axes(handles.axes1); %ָ��������
I = imread('mark3.bmp'); %����ͼ��
imshow(I); %��ʾͼ��

function pushbutton8_Callback(hObject, eventdata, handles)%Arnold�û���ť

axes(handles.axes1); %ָ��������
I = imread('��Arnold����ˮӡ.bmp'); %����ͼ��
imshow(I); %��ʾͼ��

function pushbutton10_Callback(hObject, eventdata, handles)%�رս��水ť
close all;


function pushbutton14_Callback(hObject, eventdata, handles)%��Arnold�û���ť
axes(handles.axes1); %ָ��������
I = imread('getmark6.bmp'); %����ͼ��
imshow(I); %��ʾͼ��

function pushbutton15_Callback(hObject, eventdata, handles)%Logistic���ܰ�ť
axes(handles.axes1); %ָ��������
I = imread('logistic���ܺ��ˮӡͼ��.bmp'); %����ͼ��
imshow(I); %��ʾͼ��


function pushbutton16_Callback(hObject, eventdata, handles)%Ƕ��ˮӡ��ť
axes(handles.axes1); %ָ��������
I = imread('�Ѽ���ˮӡ.bmp'); %����ͼ��
imshow(I); %��ʾͼ��

function pushbutton26_Callback(hObject, eventdata, handles)%�Ӵ�ֵ��ȡ��ť
open('C:\Users\DELL\Desktop\xiugai\test.exe')   


function pushbutton27_Callback(hObject, eventdata, handles)%�Ӵ�ֵ��ȡ��ť
open('C:\Users\DELL\Desktop\xiugai\test.exe')   




function pushbutton1_CreateFcn(hObject, eventdata, handles)%��ʼ����
I = imread('ԭʼͼ��.bmp');    %��ȡ����ͼ��
erzhitu;
Logistic1;
W = imread('mark.bmp');    %��ȡˮӡͼ��
rngseed=rng('default');     %��Կ2�����������
flag = 1;
[Iw,psnr,k1,k2]=setdwtwatermark(I,W,rngseed,flag);    %ˮӡǶ��
k1;
k2;
ImageB = imread ('�Ѽ���ˮӡ.bmp');
%����ˮӡͼ���ֵ�����
ImageA = double(I);
%dPSNR = psnr(ImageA,ImageB);

[Wg,nc]=getdwtwatermark(Iw,W,rngseed,flag,k1,k2);      %ˮӡ��ȡ
Logistic2;

disp(['PSNR=',num2str(psnr)]);
disp(['δ�ܵ�����ʱNCֵ=',num2str(nc)]);

action={'�˲�','ѹ��','����','�и�','��ת'};
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
       axes(handles.axes1); %ָ��������
       I = imread('��ת�������ͼ��.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
    case 2
       axes(handles.axes1); %ָ��������
       I = imread('ѹ���������ͼ��.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
    case 3
       axes(handles.axes1); %ָ��������
       I = imread('�и�����ͼ��.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
    case 4
       axes(handles.axes1); %ָ��������
       I = imread('�˲��������ͼ��.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
    case 5  
       axes(handles.axes1); %ָ��������
       I = imread('�����������ͼ��.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
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
axes(handles.axes1); %ָ��������
I = imread('mark2.bmp'); %����ͼ��
imshow(I); %��ʾͼ��


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
axes(handles.axes1); %ָ��������
I = imread('ԭʼͼ��.bmp'); %����ͼ��
imshow(I); %��ʾͼ��


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
