object DMRest: TDMRest
  Height = 200
  Width = 727
  object XMLTransformProvider: TXMLTransformProvider
    CacheData = True
    Left = 585
    Top = 32
  end
  object RESTClient: TRESTClient
    Authenticator = HTTPBasicAuthenticator
    Params = <>
    SynchronizedEvents = False
    Left = 206
    Top = 32
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 300
    Top = 32
  end
  object RESTResponse: TRESTResponse
    Left = 402
    Top = 32
  end
  object HTTPBasicAuthenticator: THTTPBasicAuthenticator
    Left = 80
    Top = 32
  end
  object CDSCep: TClientDataSet
    PersistDataPacket.Data = {
      250100009619E0BD01000000180000000A000000000003000000250103436570
      0100490000000100055749445448020002000A000A4C6F677261646F75726F01
      004900000001000557494454480200020064000B436F6D706C656D656E746F01
      004900000001000557494454480200020064000662616972726F010049000000
      01000557494454480200020032000A4C6F63616C696461646501004900000001
      0005574944544802000200320002556601004900000001000557494454480200
      0200020004696267650100490000000100055749445448020002000A00036769
      610100490000000100055749445448020002000A000364646401004900000001
      00055749445448020002000A0005736961666901004900000001000557494454
      48020002000A000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 112
    object CDSCepCep: TStringField
      FieldName = 'Cep'
      Size = 10
    end
    object CDSCepLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 100
    end
    object CDSCepComplemento: TStringField
      FieldName = 'Complemento'
      Size = 100
    end
    object CDSCepbairro: TStringField
      FieldName = 'bairro'
      Size = 50
    end
    object CDSCepLocalidade: TStringField
      FieldName = 'Localidade'
      Size = 50
    end
    object CDSCepUf: TStringField
      FieldName = 'Uf'
      Size = 2
    end
    object CDSCepibge: TStringField
      FieldName = 'ibge'
      Size = 10
    end
    object CDSCepgia: TStringField
      FieldName = 'gia'
      Size = 10
    end
    object CDSCepddd: TStringField
      FieldName = 'ddd'
      Size = 10
    end
    object CDSCepsiafi: TStringField
      FieldName = 'siafi'
      Size = 10
    end
  end
end
