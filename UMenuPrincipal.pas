unit UMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TfmMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Expedientes1: TMenuItem;
    AbrirExpediente1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure AbrirExpediente1Click(Sender: TObject);
  private
    { Private declarations }
    EstaLogueado : Boolean;
    procedure AbrirExpediente;
  public
    { Public declarations }
  end;

var
  fmMenuPrincipal: TfmMenuPrincipal;

implementation
  uses URegistro, UAgenda;
{$R *.dfm}



procedure TfmMenuPrincipal.AbrirExpediente;
begin
  fmAgenda.ShowModal;
end;

procedure TfmMenuPrincipal.AbrirExpediente1Click(Sender: TObject);
begin
  if EstaLogueado then
  begin
    AbrirExpediente;
  end
  else
  begin

    if Registro_Log.ShowModal = mrOk then
    begin
      EstaLogueado := True;
      AbrirExpediente;
    end;
  end;
end;

procedure TfmMenuPrincipal.FormCreate(Sender: TObject);
begin
  EstaLogueado := False;
end;

procedure TfmMenuPrincipal.Salir1Click(Sender: TObject);
begin
  Close;
end;

end.
