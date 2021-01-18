unit img_load_thrd;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type
  TStatus = (sNone, sLoading, sLoaded, sDone);
  TStatProc = procedure(const idx: Integer; const stat: TStatus);

  TMyThread = class(TThread)
  private
    fIdx: Integer;
    fStatus: TStatus;
    procedure SetStatus;
  protected
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    procedure Execute; override;
  end;

procedure thrdInit;
procedure thrdSetStatusProc(_proc: TStatProc);
procedure thrdDeInit;
procedure thrdLoadFile(const _idx: Integer; const _fn: String);

var
  img: Array [1..5] of TImage = (nil, nil, nil, nil, nil);
  fn: Array [1..5] of String;
  stat: Array [1..5] of TStatus;

implementation

var
  statProc: TStatProc = nil;


procedure thrdInit;
var
  i: Integer;
begin
  for i := 1 to 5 do
  begin
    fn[i] := '';
    stat[i] := sNone;
    img[i] := TImage.Create(nil);
  end;
end;

procedure thrdSetStatusProc(_proc: TStatProc);
begin
  statProc := _proc;
end;

procedure thrdDeInit;
var
  i: Integer;
begin
  for i := 1 to 5 do
  begin
    fn[i] := '';
    stat[i] := sNone;
    if Assigned(img[i]) then
      img[i].Free;
  end;
end;

procedure thrdLoadFile(const _idx: Integer; const _fn: String);
var
  thrd: TMyThread;
begin
  if _idx<1 then Exit;
  if _idx>5 then Exit;

  if fn[_idx] = _fn then
    Exit; // unchanged.

  fn[_idx] := _fn;
  thrd := TMyThread.Create(True);
  thrd.fIdx := _idx;

  thrd.Start;
end;

constructor TMyThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := True;

  fStatus := sNone;
  Synchronize(@SetStatus);
end;

destructor TMyThread.Destroy;
begin
  fStatus := sDone;
  Synchronize(@SetStatus);

  inherited Destroy;
end;

procedure TMyThread.SetStatus;
// this method is executed by the mainthread and can therefore access all GUI elements.
begin
  stat[fIdx] := fStatus;
  if Assigned(statProc) then
    statProc(fIdx, stat[fIdx]);
end;

procedure TMyThread.Execute;
begin
  fStatus := sNone;
  Synchronize(@SetStatus);

  if FileExists(fn[fIdx]) then
  begin
    fStatus := sLoading;
    Synchronize(@SetStatus);
    img[fIdx].Picture.LoadFromFile(fn[fIdx]);
    fStatus := sLoaded;
    Synchronize(@SetStatus);
  end;
end;


end.

