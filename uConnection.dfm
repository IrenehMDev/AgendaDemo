object dmConnection: TdmConnection
  Height = 449
  Width = 754
  PixelsPerInch = 96
  object connectionAg: TFDConnection
    Params.Strings = (
      'SERVER=DESKTOP-634HKIC'
      'OSAuthent=Yes'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=DESKTOP-634HKIC'
      'MARS=yes'
      'Database=AgendaDemo'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object QryEmpleado: TFDQuery
    Connection = connectionAg
    SQL.Strings = (
      'select * from Empleado')
    Left = 40
    Top = 112
  end
  object QryCitas: TFDQuery
    Connection = connectionAg
    SQL.Strings = (
      'select * from Cita')
    Left = 128
    Top = 112
  end
end
