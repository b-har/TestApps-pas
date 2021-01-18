unit img_load_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, FileCtrl,
  StdCtrls;

type

  { TForm1 }



  TForm1 = class(TForm)
    flb: TFileListBox;
    imgCurr: TImage;
    imgLast: TImage;
    imgPrev: TImage;
    imgNext: TImage;
    imgFirst: TImage;
    memLog: TMemo;
    procedure flbChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses
  img_load_thrd;

{$R *.lfm}

{ TForm1 }



  procedure LoadImage(const fn_first: String;
                      const fn_prev: String;
                      const fn_curr: String;
                      const fn_next: String;
                      const fn_last: String);
  begin
    if FileExists(fn_curr) then
    begin
      // shouldn't have to load -- copy from one of threaded loads
      // if have to, load in this main thread

      if fn_curr = fn_next then
        Form1.imgCurr.Picture.Assign(img[2].Picture)
      else if fn_curr = fn_prev then
        Form1.imgCurr.Picture.Assign(img[3].Picture)
      else if fn_curr = fn_last then
        Form1.imgCurr.Picture.Assign(img[4].Picture)
      else if fn_curr = fn_first then
        Form1.imgCurr.Picture.Assign(img[5].Picture)
      else
        // not queued; load directly from file
        Form1.imgCurr.Picture.LoadFromFile(fn_curr);
    end;

    if FileExists(fn_next) then
    begin
      thrdLoadFile(2, fn_next);

    end;

    if FileExists(fn_prev) then
    begin
      thrdLoadFile(3, fn_prev);

    end;

    if FileExists(fn_last) then
    begin
      thrdLoadFile(4, fn_last);

    end;

    if FileExists(fn_first) then
    begin
      thrdLoadFile(5, fn_first);

    end;

  end;

procedure TForm1.flbChange(Sender: TObject);
var
  dir: String;
  ifirst, ilast, iprev, inext, icurr: Integer;
  sfirst, slast, sprev, snext, scurr: String;
begin
  if flb.ItemIndex<0 then
    Exit;

  if flb.Items.Count<1 then
    Exit;

  ifirst := 0;
  iprev := flb.ItemIndex-1;
  icurr := flb.ItemIndex;
  inext := flb.ItemIndex+1;
  ilast := flb.Items.Count-1;

  if iprev<ifirst then iprev := -1;
  if inext>=ilast then inext := -1;

  dir := flb.Directory;

  scurr := dir + flb.Items[icurr];
  sfirst := dir + flb.Items[ifirst];
  slast := dir + flb.Items[ilast];
  sprev := '';
  snext := '';
  if iprev>-1 then sprev := dir + flb.Items[iprev];
  if inext>-1 then snext := dir + flb.Items[inext];

  LoadImage(sfirst, sprev, scurr, snext, slast);
end;

procedure StatusProc(const idx: Integer; const stat: TStatus);
begin
  case stat of
    sNone    : Form1.memLog.Lines.Add(IntToStr(idx) + ' - ' + 'None');
    sLoading : Form1.memLog.Lines.Add(IntToStr(idx) + ' - ' + 'Loading');
    sLoaded  : Form1.memLog.Lines.Add(IntToStr(idx) + ' - ' + 'Loaded');
    sDone    :
      begin
        Form1.memLog.Lines.Add(IntToStr(idx) + ' - ' + 'Done');
        case idx of
          2 : Form1.imgNext.Picture.Assign(img[2].Picture);
          3 : Form1.imgPrev.Picture.Assign(img[3].Picture);
          4 : Form1.imgLast.Picture.Assign(img[4].Picture);
          5 : Form1.imgFirst.Picture.Assign(img[5].Picture);
        end;
      end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  thrdInit;
  thrdSetStatusProc(@StatusProc);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  thrdDeInit;
end;

end.

