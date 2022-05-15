object fmAgenda: TfmAgenda
  Left = 0
  Top = 0
  Caption = 'Agenda'
  ClientHeight = 571
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 60
    Align = alTop
    TabOrder = 0
    object btnNueva: TButton
      Left = 10
      Top = 10
      Width = 60
      Height = 40
      Caption = '&Nueva'
      TabOrder = 0
      OnClick = btnNuevaClick
    end
    object btnEditat: TButton
      Left = 69
      Top = 10
      Width = 60
      Height = 40
      Caption = '&Editar'
      TabOrder = 1
    end
    object btnEliminar: TButton
      Left = 128
      Top = 10
      Width = 60
      Height = 40
      Caption = '&Eliminar'
      TabOrder = 2
    end
    object btnImprime: TButton
      Left = 187
      Top = 10
      Width = 60
      Height = 40
      Caption = '&Imprimir'
      TabOrder = 3
    end
    object btnBuscar: TButton
      Left = 246
      Top = 10
      Width = 60
      Height = 40
      Caption = '&Buscar'
      TabOrder = 4
    end
    object btnActualiza: TButton
      Left = 305
      Top = 10
      Width = 60
      Height = 40
      Caption = '&Actualiza'
      TabOrder = 5
    end
    object btnSalir: TButton
      Left = 364
      Top = 10
      Width = 60
      Height = 40
      Caption = '&Salir'
      TabOrder = 6
      OnClick = btnSalirClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 634
    Top = 60
    Width = 250
    Height = 511
    Align = alRight
    TabOrder = 1
    ExplicitHeight = 581
    object MonthCalendar: TMonthCalendar
      Left = 2
      Top = 17
      Width = 246
      Height = 160
      Align = alTop
      Date = 44695.000000000000000000
      TabOrder = 0
      OnClick = MonthCalendarClick
      ExplicitLeft = 6
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 177
      Width = 246
      Height = 332
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 402
      object Label1: TLabel
        Left = 15
        Top = 30
        Width = 63
        Height = 15
        Caption = 'Seleccionar:'
      end
      object Label2: TLabel
        Left = 15
        Top = 95
        Width = 109
        Height = 15
        Caption = 'Nombre del m'#233'dico:'
      end
      object Button1: TButton
        Left = 15
        Top = 168
        Width = 150
        Height = 25
        Caption = '&Citas no programadas'
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 15
        Top = 116
        Width = 216
        Height = 23
        DataField = 'nombreCompleto'
        DataSource = dsEmpleado
        TabOrder = 1
      end
      object cbxDpto: TDBComboBox
        Left = 16
        Top = 51
        Width = 145
        Height = 23
        Style = csDropDownList
        DataSource = dsEmpleado
        Items.Strings = (
          'Otro'
          'Medico'
          'Enfermero')
        TabOrder = 2
      end
    end
  end
  object gridCitas: TDBGrid
    Left = 0
    Top = 60
    Width = 634
    Height = 511
    Align = alClient
    DataSource = dscCitas
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object dsEmpleado: TDataSource
    DataSet = dmConnection.QryEmpleado
    Left = 504
    Top = 328
  end
  object dscCitas: TDataSource
    AutoEdit = False
    DataSet = dmConnection.QryCitas
    Left = 440
    Top = 328
  end
end
