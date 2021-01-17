unit udp_testapp_common;

interface

uses
  Graphics;

const
  DEF_LOCALHOST = '127.0.0.1';

  DEFAULT_PORT = 3000;
  DEFAULT_IP   = DEF_LOCALHOST;

  MAX_LOG_LINES = 100;

  clOn: TColor = $00CC00;   // bright green
  clOff: TColor = $002200;  // dark green

type
  TIpAndPort = record
    IP: String;
    Port: Word;
  end;

  function IPLength(const ip: String): String;

var
  SingleLocalIP: String = '';

implementation

function IPLength(const ip: String): String;
begin
  Result := ip;
  while Length(Result)<15 do
    Result := Result + ' ';
end;

end.
