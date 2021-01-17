object frmClientSettings: TfrmClientSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Client Settings'
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
  object edCli1IP: TLabeledEdit
    Left = 64
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Client 1 IP:'
    LabelPosition = lpLeft
    TabOrder = 0
    Text = '127.0.0.1'
  end
  object edCli2IP: TLabeledEdit
    Left = 64
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Client 2 IP:'
    LabelPosition = lpLeft
    TabOrder = 2
    Text = '127.0.0.1'
  end
  object edCli3IP: TLabeledEdit
    Left = 64
    Top = 64
    Width = 121
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Client 3 IP:'
    LabelPosition = lpLeft
    TabOrder = 4
    Text = '127.0.0.1'
  end
  object edCli1Port: TLabeledEdit
    Left = 224
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
  object edCli2Port: TLabeledEdit
    Left = 224
    Top = 40
    Width = 81
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Port:'
    LabelPosition = lpLeft
    TabOrder = 3
    Text = '2201'
  end
  object edCli3Port: TLabeledEdit
    Left = 224
    Top = 64
    Width = 81
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Port:'
    LabelPosition = lpLeft
    TabOrder = 5
    Text = '2201'
  end
end
