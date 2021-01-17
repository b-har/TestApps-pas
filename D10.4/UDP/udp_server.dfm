object frmUDPServer: TfrmUDPServer
  Left = 0
  Top = 0
  Width = 734
  Height = 407
  TabOrder = 0
  object indServer: TShape
    Left = 8
    Top = 42
    Width = 16
    Height = 16
    Brush.Color = 12800
    Pen.Width = 2
    Shape = stCircle
  end
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 0
    Width = 89
    Height = 25
    Caption = 'Settings'
    OnClick = SpeedButton1Click
  end
  object edSrvPort: TLabeledEdit
    Left = 256
    Top = 40
    Width = 81
    Height = 21
    Color = clBtnFace
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Port:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 0
    Text = '2201'
  end
  object edSrvIP: TLabeledEdit
    Left = 96
    Top = 40
    Width = 121
    Height = 21
    Color = clBtnFace
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = 'Server IP:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object usrv: TIdUDPServer
    OnStatus = usrvStatus
    Bindings = <>
    DefaultPort = 2201
    OnUDPRead = usrvUDPRead
    Left = 104
  end
end
