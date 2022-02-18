object SettingsForm: TSettingsForm
  Left = 645
  Top = 416
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Counter settings'
  ClientHeight = 125
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CounterLabel: TLabel
    Left = 36
    Top = 20
    Width = 37
    Height = 13
    Caption = 'Counter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SuffixLabel: TLabel
    Left = 45
    Top = 56
    Width = 26
    Height = 13
    Caption = 'Suffix'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CounterSpinEdit: TSpinEdit
    Left = 88
    Top = 16
    Width = 49
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxValue = 999
    MinValue = 1
    ParentFont = False
    TabOrder = 0
    Value = 1
  end
  object SuffixEdit: TEdit
    Left = 88
    Top = 53
    Width = 49
    Height = 21
    TabOrder = 1
  end
  object SetButton: TButton
    Left = 16
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Set'
    TabOrder = 2
    OnClick = SetButtonClick
  end
  object ResetCounterButton: TButton
    Left = 104
    Top = 88
    Width = 97
    Height = 25
    Caption = 'Reset to default'
    TabOrder = 3
    OnClick = ResetCounterButtonClick
  end
end
