program AgendaDemo;

uses
  Vcl.Forms,
  uAgenda in 'uAgenda.pas' {fmAgenda},
  uConnection in 'uConnection.pas' {dmConnection: TDataModule},
  uRegistro in 'uRegistro.pas' {Registro_Log},
  UMenuPrincipal in 'UMenuPrincipal.pas' {fmMenuPrincipal},
  URestRandomUser in 'URestRandomUser.pas' {dmRestRandomUser: TDataModule},
  uCita in 'uCita.pas' {fmCita};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMenuPrincipal, fmMenuPrincipal);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TRegistro_Log, Registro_Log);
  Application.CreateForm(TfmAgenda, fmAgenda);
  Application.CreateForm(TdmRestRandomUser, dmRestRandomUser);
  Application.CreateForm(TfmCita, fmCita);
  Application.Run;
end.
