object fmMain: TfmMain
  Left = 228
  Top = 154
  Width = 500
  Height = 350
  Caption = '40K Roller'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 297
    Width = 492
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object pnlRollSettings: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 75
    Align = alTop
    Constraints.MinHeight = 75
    PopupMenu = PopupMenu1
    TabOrder = 1
    DesignSize = (
      492
      75)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 61
      Height = 13
      Caption = '# dice to roll:'
    end
    object Label4: TLabel
      Left = 80
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Die size:'
    end
    object edNumDice: TEdit
      Left = 8
      Top = 24
      Width = 49
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      Text = '1'
    end
    object udNumDice: TUpDown
      Left = 57
      Top = 24
      Width = 16
      Height = 32
      Associate = edNumDice
      Min = 1
      Max = 60
      Position = 1
      TabOrder = 1
    end
    object btnRoll: TButton
      Left = 147
      Top = 8
      Width = 257
      Height = 57
      Caption = 'Roll!'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 4
      OnClick = btnRollClick
    end
    object edDieSize: TEdit
      Left = 80
      Top = 24
      Width = 49
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 2
      Text = '6'
    end
    object udDieSize: TUpDown
      Left = 129
      Top = 24
      Width = 16
      Height = 32
      Associate = edDieSize
      Min = 3
      Position = 6
      TabOrder = 3
    end
    object btnHistory: TButton
      Left = 407
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'History'
      TabOrder = 5
      OnClick = btnHistoryClick
    end
  end
  object pnlRollDetails: TPanel
    Left = 0
    Top = 75
    Width = 492
    Height = 222
    Align = alClient
    TabOrder = 2
    object pnlCurrentResult: TPanel
      Left = 1
      Top = 1
      Width = 490
      Height = 220
      Align = alClient
      Constraints.MinHeight = 200
      Constraints.MinWidth = 200
      TabOrder = 0
      object Label3: TLabel
        Left = 1
        Top = 1
        Width = 488
        Height = 13
        Align = alTop
        Caption = 'Current Roll'
      end
      object Splitter2: TSplitter
        Left = 1
        Top = 85
        Width = 488
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object sg1: TStringGrid
        Left = 1
        Top = 14
        Width = 488
        Height = 71
        Align = alClient
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
      end
      object pnlStats: TPanel
        Left = 1
        Top = 88
        Width = 488
        Height = 131
        Align = alBottom
        TabOrder = 1
        object Label5: TLabel
          Left = 1
          Top = 1
          Width = 486
          Height = 13
          Align = alTop
          Caption = 'Roll Statistics'
        end
        object Memo1: TMemo
          Left = 1
          Top = 14
          Width = 486
          Height = 116
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 16
    object Roll1: TMenuItem
      Caption = 'Roll!'
      OnClick = btnRollClick
    end
  end
  object XPManifest1: TXPManifest
    Left = 168
    Top = 16
  end
end
