object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 16
  Caption = 'UDP Test App'
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
    Height = 390
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
end
