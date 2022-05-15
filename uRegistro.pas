unit uRegistro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, Datasnap.DBClient;

type
  TRegistro_Log = class(TForm)
    lblTitulo: TLabel;
    gbxLogin: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    btnLogin: TButton;
    gbxRegistro: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    label6: TLabel;
    btnRegistro: TButton;
    edtMail: TEdit;
    edtCont: TEdit;
    edtNombreR: TEdit;
    edtMailR: TEdit;
    edtContR: TEdit;
    cbxEspR: TComboBox;
    btnOpRegistro: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRegistroClick(Sender: TObject);
    procedure btnOpRegistroClick(Sender: TObject);
  private
    function ValidarDatos: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Registro_Log: TRegistro_Log;

implementation
  uses uConnection, uAgenda;

{$R *.dfm}

//Validar y ayudar al usuario a que los datos no esten vacios
Function TRegistro_Log.ValidarDatos : Boolean;
Begin
 var  s := '';
  if Trim(edtNombreR.Text) = '' Then
    s := s + '[Nombre] ';
  if Trim(edtMailR.Text) = '' Then
    s := s + '[Mail] ';
  if Trim(edtContR.Text) = '' Then
    s := s + '[Contraseña] ';
  if s <> '' Then
    ShowMessage('Error: El campo: ' + s+' es requerido');
  result := s = '';
end;

procedure TRegistro_Log.btnOpRegistroClick(Sender: TObject);
begin
   registro_Log.lblTitulo.Caption := 'Registro';
   registro_Log.gbxRegistro.Visible := True;
   registro_Log.gbxLogin.Visible := False;
   btnOpRegistro.Visible := False;
end;

procedure TRegistro_Log.btnRegistroClick(Sender: TObject);
begin
  if ValidarDatos then //Si los datos son correctos se guardan en la db
  begin
    dmConnection.QryEmpleado.Close;
    dmConnection.QryEmpleado.SQL.Text :=
    'INSERT INTO "Empleado" (nombreCompleto,mail, pass, claveDpto) VALUES (:nombreCompleto, :mail, :pass, :claveDpto)';
    dmConnection.QryEmpleado.ParamByName('nombreCompleto').AsString:= edtNombreR.text;
    dmConnection.QryEmpleado.ParamByName('mail').AsString:= edtMailR.text;
    dmConnection.QryEmpleado.ParamByName('pass').AsString:= edtContR.text;
    dmConnection.QryEmpleado.ParamByName('claveDpto').asInteger:= cbxEspR.ItemIndex;
    Try
      dmConnection.QryEmpleado.ExecSQL;

      //Si se registra correctamente, abre Agenda (pral)
      fmAgenda.showModal;

    except
      on E: Exception do
      begin
        MessageDlg('Sucedio un error: ' + E.Message,  mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TRegistro_Log.btnLoginClick(Sender: TObject);
begin
  dmConnection.QryEmpleado.Close;
  dmConnection.QryEmpleado.SQL.Text :=
      'SELECT * FROM empleado  WHERE mail = ''' + edtMail.Text + ''' ';
  dmConnection.QryEmpleado.Open;

  if not dmConnection.QryEmpleado.IsEmpty then
    begin
      // El usuario si existe
      if dmConnection.QryEmpleado.FieldByName('pass').AsString = edtCont.Text then   //Valida contraseña
      begin
        MessageDlg('Acceso Correcto', mtInformation, [mbOk], 0); // Darle acceso
        ModalResult := mrOk;
      end
      else
      begin
        MessageDlg('Contraseña Incorrecta', mtError, [mbOk], 0);// Contraseña incorrecta
        ModalResult := mrCancel;
      end;
    end
    else
    begin  //El correo no existe, puede editar en el mismo formulario o registrarse
      if MessageDlg('El correo no existe, ¿Deseas registrarte?',
        mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin  //Se reutiliza la forma mostrando solo formulario de registro y ocultando el login
         registro_Log.lblTitulo.Caption := 'Registro';
         registro_Log.gbxRegistro.Visible := True;
         registro_Log.gbxLogin.Visible := False;
        end;

    end;
  end;

procedure TRegistro_Log.FormShow(Sender: TObject);
begin
  gbxRegistro.Visible := False; //Ocultamos el fomulario de registro al mostrar la forma
  cbxEspR.ItemIndex   := 0;     //Valor default de la especialidad
end;

end.
