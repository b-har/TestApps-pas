unit udp_client_settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  udp_testapp_common, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask;

type
  TClientSettingsRec = record
    Client1: TIpAndPort;
    Client2: TIpAndPort;
    Client3: TIpAndPort;
  end;

  TfrmClientSettings = class(TForm)
    sbOK: TSpeedButton;
    sbCancel: TSpeedButton;
    edCli1IP: TLabeledEdit;
    edCli2IP: TLabeledEdit;
    edCli3IP: TLabeledEdit;
    edCli1Port: TLabeledEdit;
    edCli2Port: TLabeledEdit;
    edCli3Port: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure sbOKClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidateSettings: Boolean;
  end;

  procedure LoadDefaultClientSettings;

var
  ClientSettings: TClientSettingsRec;

implementation

{$R *.dfm}

procedure LoadDefaultClientSettings;
begin
  ClientSettings.Client1.IP := DEFAULT_IP;
  ClientSettings.Client1.Port := DEFAULT_PORT;

  ClientSettings.Client2.IP := DEFAULT_IP;
  ClientSettings.Client2.Port := DEFAULT_PORT;

  ClientSettings.Client3.IP := DEFAULT_IP;
  ClientSettings.Client3.Port := DEFAULT_PORT;
end;

procedure TfrmClientSettings.FormShow(Sender: TObject);
begin
  edCli1IP.Text := ClientSettings.Client1.IP;
  edCli1Port.Text := IntToStr(ClientSettings.Client1.Port);

  edCli2IP.Text := ClientSettings.Client2.IP;
  edCli2Port.Text := IntToStr(ClientSettings.Client2.Port);

  edCli3IP.Text := ClientSettings.Client3.IP;
  edCli3Port.Text := IntToStr(ClientSettings.Client3.Port);
end;

procedure TfrmClientSettings.sbOKClick(Sender: TObject);
begin
  if ValidateSettings then
  begin
    ClientSettings.Client1.IP := edCli1IP.Text;
    ClientSettings.Client1.Port := StrToIntDef(edCli1IP.Text, DEFAULT_PORT);
    ClientSettings.Client2.IP := edCli2IP.Text;
    ClientSettings.Client2.Port := StrToIntDef(edCli2IP.Text, DEFAULT_PORT);
    ClientSettings.Client3.IP := edCli3IP.Text;
    ClientSettings.Client3.Port := StrToIntDef(edCli3IP.Text, DEFAULT_PORT);

    ModalResult := mrOk;
  end;
end;

procedure TfrmClientSettings.sbCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmClientSettings.ValidateSettings: Boolean;
begin
  // validate IP/Port here if desired.

  Result := True;
end;

end.
