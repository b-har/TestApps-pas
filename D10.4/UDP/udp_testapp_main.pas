unit udp_testapp_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  udp_server,
  udp_client, Vcl.ExtCtrls, Vcl.Imaging.pngimage, IdGlobal, IDStack;

type
  TfrmMain = class(TForm)
    memLog: TMemo;
    panToolbar: TPanel;
    sbServer: TSpeedButton;
    sbClient: TSpeedButton;
    procedure sbServerClick(Sender: TObject);
    procedure sbClientClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    frmUDPClient: TfrmUDPClient;
    frmUDPServer: TfrmUDPServer;
  public
    { Public declarations }

    procedure logClear;
    procedure log(const event: String);
  end;

var
  frmMain: TfrmMain;

implementation

uses
  udp_testapp_common;

{$R *.dfm}


procedure TfrmMain.logClear;
begin
  memLog.Lines.Clear;
end;


procedure TfrmMain.log(const event: String);
begin
  while memLog.Lines.Count>MAX_LOG_LINES do
    memLog.Lines.Delete(0);

  memLog.Lines.Add(event);
  SendMessage(memLog.Handle, WM_VSCROLL, SB_BOTTOM, 0);
end;


procedure TfrmMain.FormCreate(Sender: TObject);
var
  i: Integer;
  iplist: TIdStackLocalAddressList;
begin
  // when app starts -- clear the log and add all the local IP addresses
  // if there is only a single local IP, remember it for when the server
  // is initialized

  logClear;

  iplist := TIdStackLocalAddressList.Create;
  try
    TIdStack.IncUsage;
    try
      GStack.GetLocalAddressList(iplist);
    finally
      TIdStack.DecUsage;
    end;

    if iplist.Count>0 then
      for i := 0 to iplist.Count-1 do
        if iplist[i].IPVersion = Id_IPv4 then
          memLog.Lines.Add(iplist.Addresses[i].IPAddress);

  finally
    iplist.Free;
  end;


  if memLog.Lines.Count>0 then
  begin
    // if only one local IP, remember it for the server.
    if memLog.Lines.Count = 1 then
      SingleLocalIP := Trim(memLog.Lines[0]);

    for i := 0 to memLog.Lines.Count-1 do
      memLog.Lines[i] := 'Local IP: ' + memLog.Lines[i];

    memLog.Lines.Add('');
  end;
end;


procedure TfrmMain.FormShow(Sender: TObject);
begin
  ActiveControl := nil;
end;


procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // make sure server/client frames (and their contents) are freed
  if Assigned(frmUDPClient) then
  begin
    sbClient.Down := False;
    sbClientClick(sbClient);
  end;

  if Assigned(frmUDPServer) then
  begin
    sbServer.Down := False;
    sbServerClick(sbServer);
  end;
end;


procedure TfrmMain.sbServerClick(Sender: TObject);
begin
  if sbServer.Down then
  begin
    // speedbutton is up -- create and initialize the server frame/server
    if not Assigned(frmUDPServer) then
    begin
      frmUDPServer := TfrmUDPServer.Create(Self);
      frmUDPServer.Align := alTop;
      frmUDPServer.Top := panToolbar.Top + panToolbar.Height;
      frmUDPServer.Height := 140;
      frmUDPServer.init;
      frmUDPServer.Parent := Self;
      sbClient.Visible := False;
      memLog.Visible := True;
    end;

  end else
  begin
    // speedbutton is up -- stop and free the server frame/server
    if Assigned(frmUDPServer) then
    begin
      memLog.Visible := False;
      frmUDPServer.Deinit;
      frmUDPServer.Free;
      frmUDPServer := nil;
    end;

    logClear;
    sbClient.Visible := True;
  end;
end;


procedure TfrmMain.sbClientClick(Sender: TObject);
begin
  if sbClient.Down then
  begin
    // speedbutton is up -- create and initialize the client frame/clients
    if not Assigned(frmUDPClient) then
    begin
      frmUDPClient := TfrmUDPClient.Create(Self);
      frmUDPClient.Align := alTop;
      frmUDPClient.Top := panToolbar.Top + panToolbar.Height;
      frmUDPClient.Height := 140;
      frmUDPClient.init;
      frmUDPClient.Parent := Self;
      sbServer.Visible := False;
      memLog.Visible := True;
    end;

  end else
  begin
    // speedbutton is up -- stop and free the client frame/clients
    if Assigned(frmUDPClient) then
    begin
      memLog.Visible := False;
      frmUDPClient.Deinit;
      frmUDPClient.Free;
      frmUDPClient := nil;
    end;

    logClear;
    sbServer.Visible := True;
  end;
end;


end.
