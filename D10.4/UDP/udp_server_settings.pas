unit udp_server_settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  udp_testapp_common, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TServerSettingsRec = record
    Server: TIpAndPort;
  end;

  TfrmServerSettings = class(TForm)
    edSrvPort: TLabeledEdit;
    edSrvIP: TLabeledEdit;
    sbOK: TSpeedButton;
    sbCancel: TSpeedButton;
    procedure sbOKClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidateSettings: Boolean;
  end;

  procedure LoadDefaultServerSettings;

var
  ServerSettings: TServerSettingsRec;

implementation

{$R *.dfm}

procedure LoadDefaultServerSettings;
begin
  ServerSettings.Server.IP := DEFAULT_IP;
  ServerSettings.Server.Port := DEFAULT_PORT;
end;

procedure TfrmServerSettings.FormShow(Sender: TObject);
begin
  edSrvIP.Text := ServerSettings.Server.IP;
  edSrvPort.Text := IntToStr(ServerSettings.Server.Port);
end;

procedure TfrmServerSettings.sbOKClick(Sender: TObject);
begin
  if ValidateSettings then
  begin
    ServerSettings.Server.IP := edSrvIP.Text;
    ServerSettings.Server.Port := StrToIntDef(edSrvIP.Text, DEFAULT_PORT);

    ModalResult := mrOk;
  end;
end;

procedure TfrmServerSettings.sbCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmServerSettings.ValidateSettings: Boolean;
begin
  // validate IP/Port here if desired.

  Result := True;
end;

end.
