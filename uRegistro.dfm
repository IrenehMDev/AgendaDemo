object Registro_Log: TRegistro_Log
  Left = 0
  Top = 0
  Caption = 'Bienvenido'
  ClientHeight = 415
  ClientWidth = 304
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
  object lblTitulo: TLabel
    Left = 111
    Top = 30
    Width = 64
    Height = 23
    Caption = 'LOGIN'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gbxRegistro: TGroupBox
    Left = 9
    Top = 80
    Width = 280
    Height = 322
    TabOrder = 1
    object Label3: TLabel
      Left = 10
      Top = 135
      Width = 26
      Height = 15
      Caption = 'Mail:'
    end
    object Label4: TLabel
      Left = 10
      Top = 192
      Width = 63
      Height = 15
      Caption = 'Contrase'#241'a:'
    end
    object Label5: TLabel
      Left = 10
      Top = 22
      Width = 47
      Height = 15
      Caption = 'Nombre:'
    end
    object label6: TLabel
      Left = 10
      Top = 78
      Width = 105
      Height = 15
      Caption = 'Especialidad/ Dpto.:'
    end
    object btnRegistro: TButton
      Left = 101
      Top = 260
      Width = 90
      Height = 40
      Caption = '&Registrar!'
      TabOrder = 0
      OnClick = btnRegistroClick
    end
    object edtNombreR: TEdit
      Left = 10
      Top = 45
      Width = 250
      Height = 23
      TabOrder = 1
    end
    object edtMailR: TEdit
      Left = 10
      Top = 159
      Width = 250
      Height = 23
      TabOrder = 2
    end
    object edtContR: TEdit
      Left = 10
      Top = 216
      Width = 250
      Height = 23
      PasswordChar = '*'
      TabOrder = 3
      Text = 'edtContR'
    end
    object cbxEspR: TComboBox
      Left = 10
      Top = 103
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 4
      Items.Strings = (
        'Medico'
        'Enfermero'
        'Otro')
    end
  end
  object gbxLogin: TGroupBox
    Left = 10
    Top = 80
    Width = 280
    Height = 225
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 22
      Width = 26
      Height = 15
      Caption = 'Mail:'
    end
    object Label2: TLabel
      Left = 10
      Top = 85
      Width = 63
      Height = 15
      Caption = 'Contrase'#241'a:'
    end
    object btnLogin: TButton
      Left = 101
      Top = 161
      Width = 90
      Height = 40
      Caption = '!&Adelante!'
      TabOrder = 0
      OnClick = btnLoginClick
    end
    object edtMail: TEdit
      Left = 10
      Top = 43
      Width = 250
      Height = 23
      TabOrder = 1
    end
    object edtCont: TEdit
      Left = 10
      Top = 106
      Width = 250
      Height = 23
      PasswordChar = '*'
      TabOrder = 2
      Text = 'Edit1'
    end
  end
  object btnOpRegistro: TButton
    Left = 230
    Top = 311
    Width = 60
    Height = 25
    Caption = '&Registro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnOpRegistroClick
  end
end
