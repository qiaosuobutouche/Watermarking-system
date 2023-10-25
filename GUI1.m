function varargout = GUI1(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI1_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before GUI1 is made visible.
function GUI1_OpeningFcn(hObject, eventdata, handles, varargin)
set(handles.axes1,'visible','off')%����ϵȡ��
set(handles.axes2,'visible','off')
set(handles.axes17,'visible','off')%����ϵȡ��
set(handles.axes18,'visible','off')

       axes(handles.axes17); %ָ��������
       I = imread('ԭʼͼ��.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
       axes(handles.axes18); %ָ��������
       I = imread('logistic���ܺ��ˮӡͼ��.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = GUI1_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function popupmenu1_Callback(hObject, eventdata, handles)


function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)%����
val=get(handles.popupmenu1,'Value');
switch val
    case 1
       axes(handles.axes1); %ָ��������
       I = imread('��ת�������ͼ��.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
    case 2
       axes(handles.axes1); %ָ��������
       I = imread('���Ź������ͼ��.bmp'); %����ͼ��
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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
val=get(handles.popupmenu2,'Value');
switch val
    case 1
       axes(handles.axes2); %ָ��������
       I = imread('��ת�������ˮӡ.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
    case 2
       axes(handles.axes2); %ָ��������
       I = imread('���Ź������ˮӡ.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
    case 3
       axes(handles.axes2); %ָ��������
       I = imread('�и�����ˮӡ.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
    case 4
       axes(handles.axes2); %ָ��������
       I = imread('�˲��������ˮӡ.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
    case 5  
       axes(handles.axes2); %ָ��������
       I = imread('�����������ˮӡ.bmp'); %����ͼ��
       imshow(I); %��ʾͼ��
end
