inherited FormPadraoConsulta: TFormPadraoConsulta
  BorderStyle = bsDialog
  Caption = 'Form Padr'#227'o Consulta'
  ClientHeight = 461
  ClientWidth = 784
  Position = poScreenCenter
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 800
  ExplicitHeight = 500
  TextHeight = 15
  object PanelTopo: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 50
    Align = alTop
    TabOrder = 0
    object BitBtnFechar: TBitBtn
      AlignWithMargins = True
      Left = 701
      Top = 3
      Width = 80
      Height = 44
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alRight
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = BitBtnFecharClick
    end
    object BitBtnImprimir: TBitBtn
      AlignWithMargins = True
      Left = 410
      Top = 3
      Width = 100
      Height = 44
      Margins.Left = 1
      Margins.Top = 2
      Margins.Right = 1
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = BitBtnImprimirClick
    end
    object BitBtnExcluir: TBitBtn
      AlignWithMargins = True
      Left = 206
      Top = 3
      Width = 100
      Height = 44
      Margins.Left = 1
      Margins.Top = 2
      Margins.Right = 1
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BitBtnExcluirClick
      ExplicitLeft = 190
      ExplicitTop = 19
    end
    object BitBtnAlterar: TBitBtn
      AlignWithMargins = True
      Left = 308
      Top = 3
      Width = 100
      Height = 44
      Margins.Left = 1
      Margins.Top = 2
      Margins.Right = 1
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 3
      OnClick = BitBtnAlterarClick
    end
    object BitBtnIncluir: TBitBtn
      AlignWithMargins = True
      Left = 104
      Top = 3
      Width = 100
      Height = 44
      Margins.Left = 1
      Margins.Top = 2
      Margins.Right = 1
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 4
      OnClick = BitBtnIncluirClick
    end
    object BitBtnPesquisar: TBitBtn
      AlignWithMargins = True
      Left = 2
      Top = 3
      Width = 100
      Height = 44
      Margins.Left = 1
      Margins.Top = 2
      Margins.Right = 1
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'Pesquisar'
      TabOrder = 5
      OnClick = BitBtnPesquisarClick
    end
  end
  object PanelParametros: TPanel
    Left = 0
    Top = 50
    Width = 784
    Height = 80
    Align = alTop
    TabOrder = 1
  end
  object DBGridConsulta: TDBGrid
    Left = 0
    Top = 130
    Width = 784
    Height = 301
    Align = alClient
    DataSource = DataSourceConsulta
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object PanelBase: TPanel
    Left = 0
    Top = 431
    Width = 784
    Height = 30
    Align = alBottom
    TabOrder = 3
  end
  object DataSourceConsulta: TDataSource
    Left = 208
    Top = 224
  end
  object DataSourceCadastro: TDataSource
    Left = 408
    Top = 224
  end
end
