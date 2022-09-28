function varargout = MorseCodeTranslator(varargin)
% MORSECODETRANSLATOR MATLAB code for MorseCodeTranslator.fig
%      MORSECODETRANSLATOR, by itself, creates a new MORSECODETRANSLATOR or raises the existing
%      singleton*.
%
%      H = MORSECODETRANSLATOR returns the handle to a new MORSECODETRANSLATOR or the handle to
%      the existing singleton*.
%
%      MORSECODETRANSLATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORSECODETRANSLATOR.M with the given input arguments.
%
%      MORSECODETRANSLATOR('Property','Value',...) creates a new MORSECODETRANSLATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MorseCodeTranslator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MorseCodeTranslator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to feedback MorseCodeTranslator

% Last Modified by GUIDE v2.5 18-Apr-2021 14:56:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MorseCodeTranslator_OpeningFcn, ...
                   'gui_OutputFcn',  @MorseCodeTranslator_OutputFcn, ...
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


% --- Executes just before MorseCodeTranslator is made visible.
function MorseCodeTranslator_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MorseCodeTranslator (see VARARGIN)

% Choose default command line output for MorseCodeTranslator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MorseCodeTranslator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MorseCodeTranslator_OutputFcn(hObject, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function english_Callback(hObject, ~, handles)
% hObject    handle to english (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of english as text
%        str2double(get(hObject,'String')) returns contents of english as a double
set(handles.english, 'Min', 0, 'Max', 2);
english=get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function english_CreateFcn(hObject, ~, handles)
% hObject    handle to english (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function morse_Callback(hObject, ~, handles)
% hObject    handle to morse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of morse as text
%        str2double(get(hObject,'String')) returns contents of morse as a double
set(handles.morse, 'Min', 0, 'Max', 2);
morse=get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function morse_CreateFcn(hObject, ~, handles)
% hObject    handle to morse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in translate.
function translate_Callback(hObject, ~, handles)
% hObject    handle to translate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject,handles);

code={'.-','-...','-.-.','-..','.','..-.','--.','....','..','.---','-.-','.-..','--','-.','---','.--.','--.-','.-.','...','-','..-','...-','.--','-..-','-.--','--..','/','.----','..---','...--','....-','.....','-....','--...','---..','----.','-----'};
alphabet={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',' ','1','2','3','4','5','6','7','8','9','0'};

if handles.radio1.Value == 1
    word=char(get(handles.english,'String'));
    word=upper(word);
    convert='';
    for i=1:length(word)
        character=word(i);
        [~, idx]=ismember(character,alphabet)
        if ~isempty(idx)
            isempty(convert)
            convert=[convert ' ' code{idx}];
            words=get(handles.english,'String');
            wordsarray=textscan(words,'%s');
            max_words=length(wordsarray{1});
            set(handles.count,'String',max_words);
        end
    end
    set(handles.morse,'String',convert);
    
elseif handles.radio2.Value == 1
    word=string(get(handles.morse,'String'));
    word=strsplit(word);
    convert='';
    for i=1:length(word)
    character=word(i);
    [~, idx]=ismember(character,code)
        if character~=code
            set(handles.english,'String','');
            errordlg('Invalid Morse Code. Please separate letters by spaces.','Error');
        elseif ~isempty(idx)
            isempty(convert)
            convert=[convert '' alphabet{idx}];
            set(handles.english,'String',convert);
            words=get(handles.english,'String');
            wordsarray=textscan(words,'%s');
            max_words=length(wordsarray{1});
            set(handles.count,'String',max_words);
        end
    end
end

% --- Executes on button press in clear.
function clear_Callback(hObject, ~, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.english,'String','');
set(handles.morse,'String','');
set(handles.count,'String','');
guidata(hObject, handles);

% --- Executes on button press in radio1.
function radio1_Callback(hObject, ~, handles)
% hObject    handle to radio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio1

% option3=get(handles.radio1, 'Value');
% 
% guidata(hObject,handles);


% --- Executes on button press in radio2.
function radio2_Callback(hObject, ~, handles)
% hObject    handle to radio2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio2

% --------------------------------------------------------------------
function file_Callback(hObject, ~, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function save_Callback(hObject, ~, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saveas(gcf,'Morse Code Translator.jpg');
msgbox('Image Saved','Saved');

% --------------------------------------------------------------------
function print_Callback(hObject, ~, handles)
% hObject    handle to print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function close_Callback(hObject, ~, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)

% --------------------------------------------------------------------
function about_Callback(hObject, ~, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function wiki_Callback(hObject, ~, handles)
% hObject    handle to wiki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://en.wikipedia.org/wiki/Morse_code', '-browser')

% --------------------------------------------------------------------
function feedback_Callback(hObject, ~, handles)
% hObject    handle to feedback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function email_Callback(hObject, ~, handles)
% hObject    handle to email (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('mailto:hfylh2@nottingham.edu.my');

% --------------------------------------------------------------------
function Functions_Callback(hObject, ~, handles)
% hObject    handle to Functions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function color_Callback(hObject, ~, handles)

% --------------------------------------------------------------------
function red_Callback(hObject, ~, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set (gcf, 'color', '[0.6350, 0.0780, 0.1840]');

% --------------------------------------------------------------------
function blue_Callback(hObject, ~, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set (gcf, 'color', '[0.3010, 0.7450, 0.9330]');
