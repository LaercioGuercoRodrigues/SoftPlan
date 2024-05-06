inherited FormConsultaCEP: TFormConsultaCEP
  Caption = 'Consulta Endere'#231'o'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited PanelTopo: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited BitBtnExcluir: TBitBtn
      ExplicitLeft = 206
      ExplicitTop = 3
    end
    object BitBtnObterCep: TBitBtn
      AlignWithMargins = True
      Left = 514
      Top = 4
      Width = 150
      Height = 42
      Align = alLeft
      Caption = 'Obter CEP'
      TabOrder = 6
      OnClick = BitBtnObterCepClick
    end
  end
  inherited PanelParametros: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object LabelPesquisa: TLabel
      Left = 40
      Top = 32
      Width = 180
      Height = 15
      Caption = 'Pesquisar por Cep ou Logradouro:'
    end
    object EditDado: TEdit
      Left = 226
      Top = 28
      Width = 343
      Height = 23
      TabOrder = 0
    end
  end
  inherited DBGridConsulta: TDBGrid
    OnCellClick = DBGridConsultaCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_endereco'
        Title.Caption = 'ID'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cep'
        Title.Caption = 'CEP'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'logradouro'
        Title.Caption = 'Logradouro'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'complemento'
        Title.Caption = 'Complemento'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Title.Caption = 'Bairro'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'localidade'
        Title.Caption = 'Localidade'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
        Title.Caption = 'UF'
        Width = 30
        Visible = True
      end>
  end
  inherited PanelBase: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited DataSourceConsulta: TDataSource
    DataSet = DMServer.CDSListaEndereco
  end
  inherited DataSourceCadastro: TDataSource
    DataSet = DMServer.CDSEndereco
  end
end
