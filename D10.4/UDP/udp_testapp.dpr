program udp_testapp;

uses
  Vcl.Forms,
  udp_testapp_main in 'udp_testapp_main.pas' {frmMain},
  udp_client in 'udp_client.pas' {frmUDPClient: TFrame},
  udp_server in 'udp_server.pas' {frmUDPServer: TFrame},
  udp_server_settings in 'udp_server_settings.pas' {frmServerSettings: TFrame},
  udp_client_settings in 'udp_client_settings.pas' {frmClientSettings: TFrame},
  udp_testapp_common in 'udp_testapp_common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'UDP Test App';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
