object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 16
  Caption = 'UDPMon'
  ClientHeight = 423
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object memLog: TMemo
    Left = 0
    Top = 33
    Width = 688
    Height = 349
    TabStop = False
    Align = alClient
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    Visible = False
    ExplicitHeight = 390
  end
  object panToolbar: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object sbServer: TSpeedButton
      Left = 0
      Top = 0
      Width = 89
      Height = 25
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'UDP Server'
      OnClick = sbServerClick
    end
    object sbClient: TSpeedButton
      Left = 96
      Top = 0
      Width = 89
      Height = 25
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'UDP Client'
      OnClick = sbClientClick
    end
  end
  object panBottomBar: TPanel
    Left = 0
    Top = 382
    Width = 688
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 2
    Visible = False
    ExplicitLeft = 536
    ExplicitTop = 256
    ExplicitWidth = 185
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 6
      Width = 73
      Height = 27
      Caption = '&Clear'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 79
      Top = 6
      Width = 73
      Height = 27
      Caption = '&Save'
      OnClick = SpeedButton2Click
    end
    object labStatus: TLabel
      Left = 166
      Top = 13
      Width = 12
      Height = 13
      Caption = '...'
    end
  end
  object timClearStatus: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = timClearStatusTimer
    Left = 552
    Top = 248
  end
end
