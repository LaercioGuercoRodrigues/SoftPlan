object DMServer: TDMServer
  OnCreate = DataModuleCreate
  Height = 301
  Width = 473
  object SQLConnection: TSQLConnection
    DriverName = 'DataSnap'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=8321'
      'CommunicationProtocol=http'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 136
    Top = 32
  end
  object DSProviderConnectionDSSDM: TDSProviderConnection
    ServerClassName = 'TDSSDM'
    SQLConnection = SQLConnection
    Left = 136
    Top = 112
  end
  object CDSEndereco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftLargeint
        Name = 'ID_ENDERECO'
        ParamType = ptInput
      end>
    ProviderName = 'DSPEndereco'
    RemoteServer = DSProviderConnectionDSSDM
    Left = 320
    Top = 192
    object CDSEnderecoid_endereco: TLargeintField
      FieldName = 'id_endereco'
      Required = True
    end
    object CDSEnderecocep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object CDSEnderecologradouro: TStringField
      FieldName = 'logradouro'
      Size = 100
    end
    object CDSEnderecocomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object CDSEnderecobairro: TStringField
      FieldName = 'bairro'
      Size = 50
    end
    object CDSEnderecolocalidade: TStringField
      FieldName = 'localidade'
      Size = 50
    end
    object CDSEnderecouf: TStringField
      FieldName = 'uf'
      Size = 2
    end
  end
  object CDSListaEndereco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOGRADOURO'
        ParamType = ptInput
      end>
    ProviderName = 'DSPListaCendereco'
    RemoteServer = DSProviderConnectionDSSDM
    Left = 136
    Top = 192
    object CDSListaEnderecoid_endereco: TLargeintField
      FieldName = 'id_endereco'
      Origin = 'id_endereco'
      Required = True
    end
    object CDSListaEnderecocep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object CDSListaEnderecologradouro: TStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 100
    end
    object CDSListaEnderecocomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 100
    end
    object CDSListaEnderecobairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 50
    end
    object CDSListaEnderecolocalidade: TStringField
      FieldName = 'localidade'
      Origin = 'localidade'
      Size = 50
    end
    object CDSListaEnderecouf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Protocol=http'
      'Port=8321'
      'Server=localhost'
      'DriverID=DS')
    LoginPrompt = False
    Left = 312
    Top = 32
  end
end
