object frmUDPClient: TfrmUDPClient
  Left = 0
  Top = 0
  Width = 686
  Height = 276
  TabOrder = 0
  PixelsPerInch = 96
  object indClient1: TShape
    Left = 8
    Top = 42
    Width = 16
    Height = 16
    Brush.Color = 12800
    Pen.Width = 2
    Shape = stCircle
  end
  object indClient2: TShape
    Left = 8
    Top = 66
    Width = 16
    Height = 16
    Brush.Color = 12800
    Pen.Width = 2
    Shape = stCircle
  end
  object indClient3: TShape
    Left = 8
    Top = 90
    Width = 16
    Height = 16
    Brush.Color = 12800
    Pen.Width = 2
    Shape = stCircle
  end
  object SpeedButton3: TSpeedButton
    Tag = 1
    Left = 552
    Top = 40
    Width = 49
    Height = 21
    Caption = '&Send'
    OnClick = sbSendClick
  end
  object SpeedButton4: TSpeedButton
    Tag = 2
    Left = 552
    Top = 64
    Width = 49
    Height = 21
    Caption = 'Send'
    OnClick = sbSendClick
  end
  object SpeedButton5: TSpeedButton
    Tag = 3
    Left = 552
    Top = 88
    Width = 49
    Height = 21
    Caption = 'Send'
    OnClick = sbSendClick
  end
  object sbSettings: TSpeedButton
    Left = 96
    Top = 0
    Width = 89
    Height = 25
    Caption = 'Settings'
    OnClick = sbSettingsClick
  end
  object sbSendTicks1: TSpeedButton
    Tag = 11
    Left = 600
    Top = 40
    Width = 73
    Height = 21
    Caption = 'Send &Ticks'
    OnClick = sbSendClick
  end
  object sbSendTicks2: TSpeedButton
    Tag = 22
    Left = 600
    Top = 64
    Width = 73
    Height = 21
    Caption = 'Send Ticks'
    OnClick = sbSendClick
  end
  object sbSendTicks3: TSpeedButton
    Tag = 33
    Left = 600
    Top = 88
    Width = 73
    Height = 21
    Caption = 'Send Ticks'
    OnClick = sbSendClick
  end
  object edCli1IP: TLabeledEdit
    Left = 96
    Top = 40
    Width = 121
    Height = 23
    TabStop = False
    Color = clBtnFace
    EditLabel.Width = 56
    EditLabel.Height = 15
    EditLabel.Caption = 'Client 1 IP:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 0
    Text = '127.0.0.1'
  end
  object edCli2IP: TLabeledEdit
    Left = 96
    Top = 64
    Width = 121
    Height = 23
    TabStop = False
    Color = clBtnFace
    EditLabel.Width = 56
    EditLabel.Height = 15
    EditLabel.Caption = 'Client 2 IP:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object edCli3IP: TLabeledEdit
    Left = 96
    Top = 88
    Width = 121
    Height = 23
    TabStop = False
    Color = clBtnFace
    EditLabel.Width = 56
    EditLabel.Height = 15
    EditLabel.Caption = 'Client 3 IP:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 2
    Text = '127.0.0.1'
  end
  object edCli1Port: TLabeledEdit
    Left = 256
    Top = 40
    Width = 81
    Height = 23
    TabStop = False
    Color = clBtnFace
    EditLabel.Width = 25
    EditLabel.Height = 15
    EditLabel.Caption = 'Port:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 3
    Text = '2201'
  end
  object edCli2Port: TLabeledEdit
    Left = 256
    Top = 64
    Width = 81
    Height = 23
    TabStop = False
    Color = clBtnFace
    EditLabel.Width = 25
    EditLabel.Height = 15
    EditLabel.Caption = 'Port:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 4
    Text = '2201'
  end
  object edCli3Port: TLabeledEdit
    Left = 256
    Top = 88
    Width = 81
    Height = 23
    TabStop = False
    Color = clBtnFace
    EditLabel.Width = 25
    EditLabel.Height = 15
    EditLabel.Caption = 'Port:'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 5
    Text = '2201'
  end
  object edTest1: TLabeledEdit
    Left = 408
    Top = 40
    Width = 143
    Height = 23
    EditLabel.Width = 50
    EditLabel.Height = 15
    EditLabel.Caption = 'Test Data:'
    LabelPosition = lpLeft
    TabOrder = 6
    Text = 'Test1'
  end
  object edTest2: TLabeledEdit
    Left = 408
    Top = 64
    Width = 143
    Height = 23
    EditLabel.Width = 50
    EditLabel.Height = 15
    EditLabel.Caption = 'Test Data:'
    LabelPosition = lpLeft
    TabOrder = 7
    Text = 'Test2'
  end
  object edTest3: TLabeledEdit
    Left = 408
    Top = 88
    Width = 143
    Height = 23
    EditLabel.Width = 50
    EditLabel.Height = 15
    EditLabel.Caption = 'Test Data:'
    LabelPosition = lpLeft
    TabOrder = 8
    Text = 'Test3'
  end
  object cbContinuous: TCheckBox
    Left = 600
    Top = 112
    Width = 75
    Height = 17
    Caption = 'Continuous'
    TabOrder = 9
    OnClick = cbContinuousClick
  end
  object ucli1: TIdUDPClient
    Tag = 1
    OnStatus = ucli1Status
    Port = 0
    OnConnected = ucli1Connected
    OnDisconnected = ucli1Disconnected
    Left = 200
  end
  object ucli2: TIdUDPClient
    Tag = 2
    OnStatus = ucli1Status
    Port = 0
    OnConnected = ucli1Connected
    OnDisconnected = ucli1Disconnected
    Left = 248
  end
  object ucli3: TIdUDPClient
    Tag = 3
    OnStatus = ucli1Status
    Port = 0
    OnConnected = ucli1Connected
    OnDisconnected = ucli1Disconnected
    Left = 296
  end
  object timClose1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = timClose1Timer
    Left = 368
  end
  object timClose2: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = timClose2Timer
    Left = 416
  end
  object timClose3: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = timClose3Timer
    Left = 464
  end
  object timContinuous: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = timContinuousTimer
    Left = 520
  end
end
