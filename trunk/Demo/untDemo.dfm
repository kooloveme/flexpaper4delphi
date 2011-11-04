object Form2: TForm2
  Left = 165
  Top = 131
  Width = 696
  Height = 480
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 600
    Top = 16
    Width = 75
    Height = 25
    Caption = 'load'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 600
    Top = 56
    Width = 75
    Height = 25
    Caption = 'gotoPage'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 600
    Top = 96
    Width = 75
    Height = 25
    Caption = 'fitWidth'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 600
    Top = 136
    Width = 75
    Height = 25
    Caption = 'fitHeight'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 600
    Top = 176
    Width = 75
    Height = 25
    Caption = 'getCurrPage'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 600
    Top = 216
    Width = 75
    Height = 25
    Caption = 'nextPage'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 600
    Top = 256
    Width = 75
    Height = 25
    Caption = 'prevPage'
    TabOrder = 6
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 600
    Top = 296
    Width = 75
    Height = 25
    Caption = 'setZoom'
    TabOrder = 7
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 600
    Top = 336
    Width = 75
    Height = 25
    Caption = 'searchText'
    TabOrder = 8
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 600
    Top = 376
    Width = 75
    Height = 25
    Caption = 'switchMode'
    TabOrder = 9
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 600
    Top = 416
    Width = 75
    Height = 25
    Caption = 'load'
    TabOrder = 10
    OnClick = Button11Click
  end
  object ShockwaveFlash1: TShockwaveFlash
    Left = 0
    Top = 0
    Width = 577
    Height = 453
    Align = alLeft
    PopupMenu = PopupMenu1
    TabOrder = 11
    ControlData = {
      6755665500090000A23B0000D22E000008000200000000000800000000000800
      0000000008000E000000570069006E0064006F00770000000800060000002D00
      310000000800060000002D003100000008000A00000048006900670068000000
      08000200000000000800060000002D0031000000080000000000080002000000
      0000080010000000530068006F00770041006C006C0000000800040000003000
      0000080004000000300000000800020000000000080000000000080002000000
      00000D0000000000000000000000000000000000080004000000310000000800
      0400000030000000080000000000080004000000300000000800080000006100
      6C006C00000008000C000000660061006C00730065000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 152
  end
end
