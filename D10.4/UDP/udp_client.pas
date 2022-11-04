unit udp_client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdUDPServer, IdGlobal,
  IdSocketHandle, IdComponent, Vcl.ExtCtrls, IdUDPClient, IdBaseComponent,
  IdUDPBase, Vcl.Buttons, Vcl.StdCtrls, System.UITypes, Vcl.Mask;

type
  TfrmUDPClient = class(TFrame)
    edCli1IP: TLabeledEdit;
    edCli2IP: TLabeledEdit;
    edCli3IP: TLabeledEdit;
    edCli1Port: TLabeledEdit;
    edCli2Port: TLabeledEdit;
    edCli3Port: TLabeledEdit;
    indClient1: TShape;
    indClient2: TShape;
    indClient3: TShape;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    edTest1: TLabeledEdit;
    edTest2: TLabeledEdit;
    edTest3: TLabeledEdit;
    ucli1: TIdUDPClient;
    ucli2: TIdUDPClient;
    ucli3: TIdUDPClient;
    timClose1: TTimer;
    timClose2: TTimer;
    timClose3: TTimer;
    sbSettings: TSpeedButton;
    sbSendTicks1: TSpeedButton;
    sbSendTicks2: TSpeedButton;
    sbSendTicks3: TSpeedButton;
    cbContinuous: TCheckBox;
    timContinuous: TTimer;
    procedure sbSendClick(Sender: TObject);
    procedure usrvStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure ucli1Connected(Sender: TObject);
    procedure ucli1Disconnected(Sender: TObject);
    procedure ucli1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure timClose1Timer(Sender: TObject);
    procedure timClose2Timer(Sender: TObject);
    procedure timClose3Timer(Sender: TObject);
    procedure sbSettingsClick(Sender: TObject);
    procedure timContinuousTimer(Sender: TObject);
    procedure cbContinuousClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure init;
    procedure settingsChanged;
    procedure startUDP;
    procedure stopUDP(const silent: Boolean);
    procedure deinit;

    procedure SendUDPProc(id: DWORD; _data: String);
  end;

implementation

{$R *.dfm}

uses
  udp_testapp_common,
  udp_testapp_main,
  udp_client_settings;

procedure TfrmUDPClient.stopUDP(const silent: Boolean);
begin
  if not silent then
    frmMain.log('Stopping network communications');

  if ucli1.Connected then ucli1.Disconnect;
  if ucli2.Connected then ucli2.Disconnect;
  if ucli3.Connected then ucli3.Disconnect;

  timClose1.Enabled := False;
  timClose2.Enabled := False;
  timClose3.Enabled := False;
end;


procedure TfrmUDPClient.timClose1Timer(Sender: TObject);
begin
  timClose1.Enabled := False;
  if ucli1.Connected then
    ucli1.Disconnect;
  indClient1.Brush.Color := clOff;
end;

procedure TfrmUDPClient.timClose2Timer(Sender: TObject);
begin
  timClose2.Enabled := False;
  if ucli2.Connected then
    ucli2.Disconnect;
  indClient2.Brush.Color := clOff;
end;

procedure TfrmUDPClient.timClose3Timer(Sender: TObject);
begin
  timClose3.Enabled := False;
  if ucli3.Connected then
    ucli3.Disconnect;
  indClient3.Brush.Color := clOff;
end;

procedure TfrmUDPClient.timContinuousTimer(Sender: TObject);
begin
  timContinuous.Enabled := False;

  if indClient1.Brush.Color = clOn then
    sbSendClick(sbSendTicks1);

  if indClient2.Brush.Color = clOn then
    sbSendClick(sbSendTicks2);

  if indClient3.Brush.Color = clOn then
    sbSendClick(sbSendTicks3);

  timContinuous.Enabled := cbContinuous.Checked;
end;

procedure TfrmUDPClient.ucli1Connected(Sender: TObject);
begin
  frmMain.log('Client ' + IntToStr(TIdUDPClient(Sender).Tag) + ' Connected to ' + IPLength(TIdUDPClient(Sender).Host) + ':' + IntToStr(TIdUDPClient(Sender).Port));
end;

procedure TfrmUDPClient.ucli1Disconnected(Sender: TObject);
begin
  frmMain.log('Client ' + IntToStr(TIdUDPClient(Sender).Tag) + ' Disconnected');
end;

procedure TfrmUDPClient.ucli1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  //

end;

procedure TfrmUDPClient.usrvStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  frmMain.log('----- Server: ' + AStatusText);

//  case AStatus of
//    hsConnected : Inc(ClientCount);
    //hsDisconnected : Dec(ClientCount);
//  end;
end;

procedure TfrmUDPClient.sbSendClick(Sender: TObject);
begin
  case TSpeedButton(Sender).Tag of
    1 : SendUDPProc(1, edTest1.Text);
    2 : SendUDPProc(2, edTest2.Text);
    3 : SendUDPProc(3, edTest3.Text);
    11 : SendUDPProc(1, IntToStr(GetTickCount));
    22 : SendUDPProc(2, IntToStr(GetTickCount));
    33 : SendUDPProc(3, IntToStr(GetTickCount));
  end;
end;

procedure TfrmUDPClient.startUDP;
begin
  ; // nothing to do on client
end;



procedure TfrmUDPClient.SendUDPProc(id: DWORD; _data: String);
var
  dst: String;
  data: String;
begin
  case id of
    1: dst := IPLength(ucli1.Host) + ':' + IntToStr(ucli1.Port);
    2: dst := IPLength(ucli2.Host) + ':' + IntToStr(ucli2.Port);
    3: dst := IPLength(ucli3.Host) + ':' + IntToStr(ucli3.Port);
  else
    Exit;
  end;

  data := Trim(_data);

  frmMain.log('SND ' + dst + ' - ' + data);

  data := data + #13;

  case id of
    1 : begin
          timClose1.Enabled := False;
          if not ucli1.Connected then
          begin
            ucli1.Connect;
            indClient1.Brush.Color := clOn;
          end;
          ucli1.Send(data);
          timClose1.Enabled := True;
        end;

    2 : begin
          timClose2.Enabled := False;
          if not ucli2.Connected then
          begin
            ucli2.Connect;
            indClient2.Brush.Color := clOn;
          end;
          ucli2.Send(data);
          timClose2.Enabled := True;
        end;

    3 : begin
          timClose3.Enabled := False;
          if not ucli3.Connected then
          begin
            ucli3.Connect;
            indClient3.Brush.Color := clOn;
          end;
          ucli3.Send(data);
          timClose3.Enabled := True;
        end;
  end;
end;


procedure TfrmUDPClient.settingsChanged;
begin
  stopUDP(True); // silent

  ucli1.Host := ClientSettings.Client1.IP;
  ucli1.Port := ClientSettings.Client1.Port;
  ucli2.Host := ClientSettings.Client2.IP;
  ucli2.Port := ClientSettings.Client2.Port;
  ucli3.Host := ClientSettings.Client3.IP;
  ucli3.Port := ClientSettings.Client3.Port;

  edCli1IP.Text := ucli1.Host;
  edCli1Port.Text := IntToStr(ucli1.Port);
  edCli2IP.Text := ucli2.Host;
  edCli2Port.Text := IntToStr(ucli2.Port);
  edCli3IP.Text := ucli3.Host;
  edCli3Port.Text := IntToStr(ucli3.Port);
end;


procedure TfrmUDPClient.init;
begin
  LoadDefaultClientSettings;
  settingsChanged;
  startUDP;
end;

procedure TfrmUDPClient.sbSettingsClick(Sender: TObject);
var
  frm: TfrmClientSettings;
begin
  frm := TfrmClientSettings.Create(Application);
  if frm.ShowModal=mrOk then
  begin
    settingsChanged;
    startUDP;
  end;

  frm.Free;
end;

procedure TfrmUDPClient.cbContinuousClick(Sender: TObject);
begin
  timContinuous.Enabled := cbContinuous.Checked;
end;

procedure TfrmUDPClient.deinit;
begin
  stopUDP(False);
end;


end.

