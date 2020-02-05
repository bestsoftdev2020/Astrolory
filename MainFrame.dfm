object Form2: TForm2
  Left = 0
  Top = 0
  Width = 1300
  Height = 940
  HorzScrollBar.Range = 2100
  BorderStyle = bsSingle
  Caption = 'Astrology Program'
  Color = clWhite
  Constraints.MaxHeight = 940
  Constraints.MaxWidth = 1300
  Constraints.MinHeight = 940
  Constraints.MinWidth = 1300
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.SheetOfGlass = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = OnInitDialog
  OnDestroy = OnDestroyDialog
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 343
    Width = 348
    Height = 554
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label2: TLabel
      Left = 120
      Top = 20
      Width = 102
      Height = 22
      Caption = 'List Manage'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object addButton: TButton
      Left = 41
      Top = 61
      Width = 71
      Height = 27
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = AddMember
    end
    object editButton: TButton
      Left = 141
      Top = 61
      Width = 69
      Height = 27
      Caption = 'Edit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = EditMember
    end
    object deleteButton: TButton
      Left = 241
      Top = 61
      Width = 70
      Height = 27
      Caption = 'Delete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = DeleteMember
    end
    object Edit1: TEdit
      Left = 24
      Top = 134
      Width = 305
      Height = 27
      BevelWidth = 5
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TextHint = 'Search'
      OnKeyUp = OnKeyUp
    end
    object ListBox: TListBox
      Left = 24
      Top = 159
      Width = 305
      Height = 298
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 19
      ParentFont = False
      TabOrder = 4
      OnClick = goTransitsChart
    end
    object Button2: TButton
      Left = 24
      Top = 485
      Width = 305
      Height = 27
      Caption = 'City Info Setting'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 9
    Top = 8
    Width = 345
    Height = 329
    BiDiMode = bdLeftToRight
    Color = clSkyBlue
    ParentBackground = False
    ParentBiDiMode = False
    ParentColor = False
    TabOrder = 1
    object Label1: TLabel
      Left = 103
      Top = 28
      Width = 126
      Height = 22
      Caption = 'Display Setting'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object goButton: TButton
      Left = 23
      Top = 129
      Width = 114
      Height = 25
      Caption = 'NatalChart'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = goNatalChart
    end
    object methodCombo: TComboBox
      Left = 23
      Top = 72
      Width = 305
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'Equal House - Asc'
    end
    object Button1: TButton
      Left = 214
      Top = 129
      Width = 114
      Height = 25
      Caption = 'Transits'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = goTransitsChart
    end
  end
  object Memo1: TMemo
    Left = 360
    Top = 8
    Width = 25
    Height = 41
    Lines.Strings = (
      'M'
      'e'
      'm'
      'o1')
    TabOrder = 2
    Visible = False
  end
  object showCircle1: TButton
    Left = 1280
    Top = 139
    Width = 75
    Height = 25
    Caption = 'Circle1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = OnShowCircle1
  end
  object showCircle2: TButton
    Left = 1376
    Top = 139
    Width = 75
    Height = 25
    Caption = 'Circle2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = OnShowCircle2
  end
end
