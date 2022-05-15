unit uCita;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, json;

type
  TfmCita = class(TForm)
    btnRandomUsers: TButton;
    procedure btnRandomUsersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCita: TfmCita;

implementation
uses uRestRandomUser;

{$R *.dfm}

//En esta forma solo realic� el consumo de la API requerida (por tiempo)
// usando Rest Debbuger y solo mostr� el consumo en el
//ShowMessage  (despues de dar "continuar" en las excepciones).
function TryReadJSONValue(vJson : TJSONValue; valor : String) : String;
begin

procedure TfmCita.btnRandomUsersClick(Sender: TObject);
var
  vResultado      : String;
begin
  dmRestRandomUser.EjecutarREST;


  ShowMessage(
  TryReadJSONValue(vJsonName, 'title') + #13 +

end;




end.