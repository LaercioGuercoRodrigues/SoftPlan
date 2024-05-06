object DSSDM: TDSSDM
  Height = 271
  Width = 508
  object FDQEndereco: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select * From Endereco Where id_endereco = :id_endereco')
    Left = 216
    Top = 96
    ParamData = <
      item
        Name = 'ID_ENDERECO'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=SoftPlan'
      'User_Name=sa'
      'Password=Laercio123'
      'Server=24.152.36.54'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 80
    Top = 16
  end
  object DSPEndereco: TDataSetProvider
    DataSet = FDQEndereco
    Left = 216
    Top = 160
  end
  object FDQListaCendereco: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'select * from endereco  where (cep like :cep) or (logradouro lik' +
        'e :logradouro) ')
    Left = 80
    Top = 96
    ParamData = <
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 216
    Top = 16
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 376
    Top = 16
  end
  object DSPListaCendereco: TDataSetProvider
    DataSet = FDQListaCendereco
    Left = 80
    Top = 160
  end
end
