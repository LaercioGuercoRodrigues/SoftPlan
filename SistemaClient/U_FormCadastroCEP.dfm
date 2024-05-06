inherited FormCadastroCEP: TFormCadastroCEP
  Caption = 'FormCadastroCEP'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited PanelTopo: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited PanelCampos: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 52
    ExplicitWidth = 584
    ExplicitHeight = 311
    object Label1: TLabel
      Left = 152
      Top = 35
      Width = 39
      Height = 15
      Alignment = taRightJustify
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 114
      Top = 147
      Width = 77
      Height = 15
      Alignment = taRightJustify
      Caption = 'Complemento'
    end
    object Label3: TLabel
      Left = 129
      Top = 110
      Width = 62
      Height = 15
      Alignment = taRightJustify
      Caption = 'Logradouro'
    end
    object Label4: TLabel
      Left = 170
      Top = 72
      Width = 21
      Height = 15
      Alignment = taRightJustify
      Caption = 'Cep'
    end
    object Label6: TLabel
      Left = 134
      Top = 222
      Width = 57
      Height = 15
      Alignment = taRightJustify
      Caption = 'Localidade'
    end
    object Label7: TLabel
      Left = 160
      Top = 185
      Width = 31
      Height = 15
      Alignment = taRightJustify
      Caption = 'Bairro'
    end
    object Label8: TLabel
      Left = 179
      Top = 260
      Width = 12
      Height = 15
      Alignment = taRightJustify
      Caption = 'Uf'
    end
    object DBEdit1: TDBEdit
      Left = 200
      Top = 32
      Width = 121
      Height = 23
      DataField = 'id_endereco'
      DataSource = DataSourceCadastro
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 200
      Top = 69
      Width = 121
      Height = 23
      DataField = 'cep'
      DataSource = DataSourceCadastro
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 200
      Top = 106
      Width = 250
      Height = 23
      DataField = 'logradouro'
      DataSource = DataSourceCadastro
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 200
      Top = 144
      Width = 250
      Height = 23
      DataField = 'complemento'
      DataSource = DataSourceCadastro
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 200
      Top = 181
      Width = 250
      Height = 23
      DataField = 'bairro'
      DataSource = DataSourceCadastro
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 200
      Top = 218
      Width = 250
      Height = 23
      DataField = 'localidade'
      DataSource = DataSourceCadastro
      TabOrder = 5
    end
    object DBEdit10: TDBEdit
      Left = 200
      Top = 256
      Width = 121
      Height = 23
      DataField = 'uf'
      DataSource = DataSourceCadastro
      TabOrder = 6
    end
  end
  inherited DataSourceCadastro: TDataSource
    DataSet = DMServer.CDSEndereco
  end
end
