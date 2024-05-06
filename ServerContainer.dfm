object ServerContainer1: TServerContainer1
  Height = 184
  Width = 426
  object DSServer1: TDSServer
    Left = 96
    Top = 27
  end
  object DSServerClassDSSDM: TDSServerClass
    OnGetClass = DSServerClassDSSDMGetClass
    Server = DSServer1
    Left = 208
    Top = 27
  end
end
