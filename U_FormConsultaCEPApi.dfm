inherited FormConsultaCEPApi: TFormConsultaCEPApi
  Caption = 'FormConsultaCEPApi'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited PanelTopo: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited BitBtnImprimir: TBitBtn
      Visible = False
    end
    inherited BitBtnExcluir: TBitBtn
      TabOrder = 6
      Visible = False
      ExplicitLeft = 206
    end
    inherited BitBtnAlterar: TBitBtn
      TabOrder = 7
      Visible = False
    end
    inherited BitBtnIncluir: TBitBtn
      Caption = 'Incluir Sel'
    end
    inherited BitBtnPesquisar: TBitBtn
      Visible = False
    end
    object BitBtnObterCep: TBitBtn
      AlignWithMargins = True
      Left = 600
      Top = 4
      Width = 80
      Height = 42
      Align = alLeft
      Caption = 'Via Endere'#231'o'
      TabOrder = 2
      OnClick = BitBtnObterCepClick
    end
    object BitBtnObterEndereco: TBitBtn
      AlignWithMargins = True
      Left = 514
      Top = 4
      Width = 80
      Height = 42
      Align = alLeft
      Caption = 'Via CEP'
      TabOrder = 3
      OnClick = BitBtnObterEnderecoClick
    end
  end
  inherited PanelParametros: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object Label1: TLabel
      Left = 309
      Top = 19
      Width = 30
      Height = 15
      Alignment = taRightJustify
      Caption = 'Cep : '
    end
    object Label2: TLabel
      Left = 281
      Top = 51
      Width = 58
      Height = 15
      Alignment = taRightJustify
      Caption = 'Endere'#231'o : '
    end
    object RadioGroupFormato: TRadioGroup
      Left = 28
      Top = 15
      Width = 141
      Height = 50
      Caption = 'Formato'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'JSon'
        'Xml')
      TabOrder = 0
    end
    object MemoConteudoCep: TMemo
      Left = 342
      Top = 14
      Width = 250
      Height = 24
      Lines.Strings = (
        '91420270')
      TabOrder = 1
    end
    object MemoConteudoEndereco: TMemo
      Left = 345
      Top = 49
      Width = 416
      Height = 25
      Lines.Strings = (
        'RS/Porto Alegre/Domingos Jose')
      TabOrder = 2
    end
  end
  inherited PanelBase: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited DataSourceConsulta: TDataSource
    DataSet = DMRest.CDSCep
  end
  inherited DataSourceCadastro: TDataSource
    DataSet = DMServer.CDSEndereco
  end
end
