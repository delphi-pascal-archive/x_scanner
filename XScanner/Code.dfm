object Form1: TForm1
  Left = 223
  Top = 128
  ActiveControl = SpinEdit1
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'XScanner'
  ClientHeight = 260
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000088
    88888888888888800000000000000087F7F7F7F7F7F7F780000000000000008F
    7F7F7F7F7F7F7F80000000000000008888888888888888800000000000000000
    0000000000000000000000000000000888888888888880000000000000000008
    FFFFFFFFFFFF80000000000000000008F7777777777F80000000000000000008
    F7000000007F80000000000000000008F7000000007F80000000000000000008
    F7000000007F80000000000000000008F7000000007F80000888888888800008
    F7000000007F800008F7F7F7F7800008F7000000007F80000888888888800008
    F7000000007F80000000000000000008F7777777777F80000088888888000008
    FFFFFFFFFFFF8000008FFFFFF80000088888888888888000008F7777F8000000
    0000A09000000000008F7007F80000000000A09000000000008F7777F8000000
    0000A09000000000008FFFFFF80000000000A090000000000088888888000000
    0000A090000000000000090A000000000000A099999999999999990A00000000
    0000A000000000000000000A000000000000AAAAAAAAAAAAAAAAAAAA00000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFC0001FFFC0001FFFC0001FFFC0001FFFFFFF
    FFFFE0007FFFE0007FFFE0007FFFE0007FFFE0007FFFE0007FFFE0007801E000
    7801E0007801E0007FFFE0007C03E0007C03E0007C03FF5FFC03FF5FFC03FF5F
    FC03FF5FFC03FF5FFFAFFF40002FFF7FFFEFFF00000FFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object ProgressBar1: TGauge
    Left = 0
    Top = 239
    Width = 606
    Height = 21
    Align = alBottom
    Color = clNavy
    ForeColor = clNavy
    ParentColor = False
    Progress = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 44
      Height = 16
      Caption = #1040#1076#1088#1077#1089':'
    end
    object Label2: TLabel
      Left = 512
      Top = 13
      Width = 37
      Height = 16
      Caption = 'Port: 0'
    end
    object SpeedButton1: TSpeedButton
      Left = 416
      Top = 8
      Width = 89
      Height = 25
      Caption = #1047#1072#1087#1091#1089#1082
      OnClick = SpeedButton1Click
    end
    object Label3: TLabel
      Left = 177
      Top = 10
      Width = 30
      Height = 16
      Caption = 'Start:'
    end
    object Label4: TLabel
      Left = 295
      Top = 10
      Width = 27
      Height = 16
      Caption = 'End:'
    end
    object Edit1: TEdit
      Left = 59
      Top = 6
      Width = 110
      Height = 24
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object SpinEdit1: TSpinEdit
      Left = 217
      Top = 6
      Width = 70
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      MaxValue = 65535
      MinValue = 0
      ParentFont = False
      TabOrder = 1
      Value = 0
    end
    object SpinEdit2: TSpinEdit
      Left = 335
      Top = 6
      Width = 70
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      MaxValue = 32768
      MinValue = 0
      ParentFont = False
      TabOrder = 2
      Value = 32768
    end
  end
  object ListBox1: TListBox
    Left = 0
    Top = 41
    Width = 606
    Height = 198
    Align = alClient
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -17
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ItemHeight = 20
    ParentFont = False
    TabOrder = 1
  end
end
