object frmServerSettings: TfrmServerSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Server Settings'
  ClientHeight = 211
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbOK: TSpeedButton
    Left = 280
    Top = 168
    Width = 81
    Height = 25
    Caption = '&OK'
    OnClick = sbOKClick
  end
  object sbCancel: TSpeedButton
    Left = 192
    Top = 168
    Width = 81
    Height = 25
    Caption = '&Cancel'
    OnClick = sbCancelClick
  end
  object edSrvPort: TLabeledEdit
    Left = 240
    Top = 16
    Width = 81
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Port:'
    LabelPosition = lpLeft
    TabOrder = 1
    Text = '2201'
  end
  object edSrvIP: TLabeledEdit
    Left = 64
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = 'Server IP:'
    LabelPosition = lpLeft
    TabOrder = 0
    Text = '127.0.0.1'
  end
end
