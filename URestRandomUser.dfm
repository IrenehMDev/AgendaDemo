object dmRestRandomUser: TdmRestRandomUser
  Height = 357
  Width = 777
  PixelsPerInch = 96
  object RESTClient1: TRESTClient
    BaseURL = 'https://randomuser.me/api'
    Params = <>
    Left = 32
    Top = 40
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 136
    Top = 40
  end
  object RESTResponse1: TRESTResponse
    Left = 240
    Top = 40
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    ResponseJSON = RESTResponse1
    RootElement = 'results'
    TypesMode = JSONOnly
    NestedElementsDepth = 1
    NestedElements = True
    Left = 392
    Top = 40
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 512
    Top = 40
  end
end
