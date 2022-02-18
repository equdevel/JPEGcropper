object MainForm: TMainForm
  Left = 440
  Top = 181
  Width = 1024
  Height = 768
  Caption = 'JPEG cropper 1.1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox: TScrollBox
    Left = 0
    Top = 0
    Width = 1008
    Height = 710
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 0
    object ImageArea: TImage
      Left = 0
      Top = 0
      Width = 1001
      Height = 705
      AutoSize = True
      Visible = False
      OnMouseDown = ImageAreaMouseDown
      OnMouseMove = ImageAreaMouseMove
      OnMouseUp = ImageAreaMouseUp
    end
  end
  object MainMenu: TMainMenu
    Left = 8
    Top = 8
    object FileMenu: TMenuItem
      Caption = 'File'
      object OpenFileMenu: TMenuItem
        Caption = 'Open...'
        ShortCut = 16463
        OnClick = OpenFileMenuClick
      end
      object QuitMenu: TMenuItem
        Caption = 'Quit'
        ShortCut = 16465
        OnClick = QuitMenuClick
      end
    end
    object SettingsMenu: TMenuItem
      Caption = 'Settings'
      object JPEGQualityMenu: TMenuItem
        Caption = 'JPEG quality'
        object Quality100: TMenuItem
          AutoCheck = True
          Caption = '100%'
          RadioItem = True
          OnClick = Quality100Click
        end
        object Quality80: TMenuItem
          AutoCheck = True
          Caption = '80%'
          Checked = True
          RadioItem = True
          OnClick = Quality80Click
        end
        object Quality60: TMenuItem
          AutoCheck = True
          Caption = '60%'
          RadioItem = True
          OnClick = Quality60Click
        end
      end
      object CounterSettingsMenu: TMenuItem
        Caption = 'Counter settings'
        OnClick = CounterSettingsMenuClick
      end
      object ResetCounterMenu: TMenuItem
        Caption = 'Reset counter'
        ShortCut = 16466
        OnClick = ResetCounterMenuClick
      end
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    InitialDir = 'img'
    Left = 40
    Top = 8
  end
end
