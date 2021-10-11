(*==================================*)
(* XScanner by XProger              *)
(* mail: XProger@list.ru            *)
(* site: http://XProger.mirgames.ru *)
(*==================================*)
unit Code;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  StdCtrls, ExtCtrls, WinSock, AppEvnts, Buttons, Gauges, Spin;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    ProgressBar1: TGauge;
    ListBox1: TListBox;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  end;

  TMyThread = class(TThread)
   protected
    procedure Execute; override;
  end;

  TFSocket = record
   sa: TSockAddr;
   FData: integer;
   TimeOut: integer;
  end;

const
 MAX_PORTS=500;
 Ping=5000;

var
  Form1: TForm1;
  FSocket: array [0..MAX_PORTS - 1] of TFSocket;
  FPort: WORD;
  FInfo: TWSADATA;
  FHost: integer;
  FPStart, FPEnd: WORD;
  SThread: TMyThread;

implementation

{$R *.dfm}

procedure TForm1.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
 if (Msg.message>=FPStart+WM_USER)
                                and (Msg.message<=FPEnd+WM_USER)
 then
 if WSAGETSELECTERROR(Msg.lParam)=0
 then
  case WSAGETSELECTEVENT(msg.lParam) of
   FD_CONNECT:
      begin
       ListBox1.Items.Add(IntToStr(ListBox1.Count+1)+
                        ') IP: '+inet_ntoa(FSocket[0].sa.sin_addr)+'  |  '+
                        'Port: '+intToStr(Msg.message - WM_USER));
       Application.ProcessMessages;
      end;
  end;
 Handled:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 i: integer;
begin
 if WSAStartup(MAKEWORD(2, 0), FInfo)<>0
 then Halt;
 for i:=0 to MAX_PORTS-1 do
 with FSocket[i] do
  begin
   TimeOut := 0;
   FData := Socket(AF_INET, SOCK_STREAM, 0);
   if FData = SOCKET_ERROR
   then
    begin
     WSACleanup;
     Halt;
    end;
  end;
 Application.OnMessage:=Form1.ApplicationEvents1Message;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
 i: integer;
begin
 if SThread<>nil
 then
  begin
   SThread.Terminate;
   SThread.WaitFor;
   SThread:=nil;
  end;
 for i:=0 to MAX_PORTS-1 do
  CloseSocket(FSocket[i].FData);
 WSACleanup;
end;

procedure InitSockets;
var
 i: integer;
begin
 for i:=0 to MAX_PORTS-1 do
  with FSocket[i] do
   if (FPort>=FPEnd) or (SThread.Terminated)
   then break
   else
    if GetTickCount-TimeOut>PING
    then
     begin
      sa.sin_family:=AF_INET;
      sa.sin_addr.S_addr:=FHost;
      sa.sin_port:=htons(FPort);
      //
      WSAAsyncSelect(FData, Application.Handle, WM_USER+FPort, FD_CONNECT);
      connect(FData, FSocket[i].sa, SizeOf(FSocket[i].sa));
      TimeOut:=GetTickCount;
      inc(FPort);
      Form1.Label2.Caption:='Port: '+intToStr(FPort);
      Form1.ProgressBar1.Progress:=trunc(((FPort-FPStart)*100)/(FPEnd-FPStart));
      Application.ProcessMessages;
      //
      Sleep(PING div MAX_PORTS);
     end;
end;

procedure TMyThread.Execute;
var
 i: integer;
 buf: in_addr;
begin
 FPStart:=Form1.SpinEdit1.Value;
 FPEnd:=Form1.SpinEdit2.Value;
 FHost:=inet_addr(PChar(Form1.Edit1.Text));
 if (FPEnd<=FPStart)or (Form1.SpinEdit1.Value>32768) or
                            (Form1.SpinEdit2.Value>32768)
 then FHost:=SOCKET_ERROR;
 if FHost=SOCKET_ERROR
 then
  begin
   if not Terminated
   then SThread:=nil;
   Form1.SpeedButton1.Caption:='Запуск';
   Exit;
  end;
 buf.S_addr:=FHost;
 Form1.Edit1.Text:=inet_ntoa(buf);
 Form1.ListBox1.Clear;
 FPort:=FPStart;
 for i:=0 to MAX_PORTS-1 do
  with FSocket[i] do
   begin
    TimeOut:=0;
    FData:=Socket(AF_INET, SOCK_STREAM, 0);
   end;
 //
 while not Terminated do
  begin
   InitSockets;
   if FPort>=FPEnd
   then break;
  end;
 //
 for i:=0 to MAX_PORTS-1 do
  CloseSocket(FSocket[i].FData);
 //
 if not Terminated
 then
  begin
   SThread:=nil;
   Form1.SpeedButton1.Caption:='Запуск';
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 if SThread=nil
 then
  begin
   SThread:=TMyThread.Create(false);
   SpeedButton1.Caption:='Стоп';
  end
 else
  begin
   SThread.Terminate;
   SThread.WaitFor;
   SThread:=nil;
   SpeedButton1.Caption:='Запуск';
  end;
end;

end.
