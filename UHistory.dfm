object fmHistory: TfmHistory
  Left = 305
  Top = 188
  Width = 548
  Height = 349
  Caption = 'History'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 540
    Height = 24
    Align = alTop
    Caption = ' History'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Splitter1: TSplitter
    Left = 341
    Top = 24
    Height = 271
    Align = alRight
  end
  object Panel1: TPanel
    Left = 0
    Top = 24
    Width = 341
    Height = 271
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object sg2: TStringGrid
      Left = 1
      Top = 1
      Width = 339
      Height = 269
      Align = alClient
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      OnClick = sg2Click
    end
  end
  object Panel2: TPanel
    Left = 344
    Top = 24
    Width = 196
    Height = 271
    Align = alRight
    Caption = 'Panel2'
    TabOrder = 1
    object histmemo: TMemo
      Left = 1
      Top = 1
      Width = 194
      Height = 269
      Align = alClient
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Save1: TMenuItem
        Caption = 'Save'
        ShortCut = 16467
        OnClick = Save1Click
      end
      object Close1: TMenuItem
        Caption = 'Close'
        ShortCut = 16472
        OnClick = Close1Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'C:\jhk'
    Filter = 'Text (*.txt)|*.txt|All (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofShareAware, ofEnableSizing]
    Left = 128
    Top = 8
  end
end
