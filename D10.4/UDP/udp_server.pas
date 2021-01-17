unit udp_server;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdUDPServer, IdGlobal,
  IdSocketHandle, IdComponent, Vcl.ExtCtrls, IdUDPClient, IdBaseComponent,
  IdUDPBase, Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmUDPServer = class(TFrame)
    edSrvPort: TLabeledEdit;
    edSrvIP: TLabeledEdit;
    indServer: TShape;
    usrv: TIdUDPServer;
    SpeedButton1: TSpeedButton;
    procedure usrvUDPRead(AThread: TIdUDPListenerThread; const AData: TIdBytes;
      ABinding: TIdSocketHandle);
    procedure usrvStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure init;
    procedure settingsChanged;
    procedure startUDP;
    procedure stopUDP(const silent: Boolean);
    procedure deinit;

  end;

implementation

{$R *.dfm}

uses
  udp_testapp_common,
  udp_testapp_main,
  udp_server_settings,
  udp_client_settings;

procedure TfrmUDPServer.stopUDP(const silent: Boolean);
begin
  if not silent then
  begin
    frmMain.log('Stopping network communications');
  end;

  if usrv.Active then
    usrv.Active := False;

  indServer.Brush.Color := clOn;
end;

procedure TfrmUDPServer.usrvStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  frmMain.log('----- Server: ' + AStatusText);
end;

procedure TfrmUDPServer.usrvUDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
var
  ss: string;
  fromip: String;
begin
  ss := Trim(BytesToString(AData));

  fromip := ABinding.PeerIP;
//  fromip := ABinding.PeerIP + ':' + IntToStr(ABinding.Port); // peer port is different.

  frmMain.log('RCV ' + IPLength(fromip) + ' - ' +ss);
end;

procedure TfrmUDPServer.startUDP;
var
  i: Integer;
begin
  stopUDP(True);

  frmMain.log('Starting network communications');

  usrv.Active := True;

  if usrv.Active then
  begin
    if usrv.Bindings.Count>0 then
      for i := 0 to usrv.Bindings.Count-1 do
        frmMain.log(' - Listening on ' + IPLength(usrv.Bindings[i].IP) + ':' + IntToStr(usrv.Bindings[i].Port));

    indServer.Brush.Color := clOn;
  end else
  begin
    frmMain.log('--Error: Unable to start.  Not listening');
  end;
end;

procedure TfrmUDPServer.SettingsChanged;
var
  Binding: TIdSocketHandle;
begin
  stopUDP(True);

  usrv.DefaultPort := ServerSettings.Server.Port;

  usrv.Bindings.Clear;

  Binding := usrv.Bindings.Add;
  Binding.IP := ServerSettings.Server.IP;
  Binding.Port := ServerSettings.Server.Port;

  // add localhost, as long as user specified host is not localhost
  if ServerSettings.Server.IP<>DEF_LOCALHOST then
  begin
    Binding := usrv.Bindings.Add;
    Binding.IP := DEF_LOCALHOST;
    Binding.Port := ServerSettings.Server.Port;
  end;

  edSrvIP.Text := ServerSettings.Server.IP;
  edSrvPort.Text := IntToStr(ServerSettings.Server.Port);
end;

procedure TfrmUDPServer.SpeedButton1Click(Sender: TObject);
var
  frm: TfrmServerSettings;
begin
  frm := TfrmServerSettings.Create(Application);
  if frm.ShowModal=mrOk then
  begin
    settingsChanged;
    startUDP;
  end;

  frm.Free;
end;

procedure TfrmUDPServer.init;
begin
  LoadDefaultServerSettings;

  if SingleLocalIP<>'' then
    ServerSettings.Server.IP := SingleLocalIP;

  settingsChanged;
  startUDP;
end;

procedure TfrmUDPServer.deinit;
begin
  stopUDP(False);
end;


end.

