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

//En esta forma solo realicé el consumo de la API requerida (por tiempo)
// usando Rest Debbuger y solo mostré el consumo en el
//ShowMessage  (despues de dar "continuar" en las excepciones).
function TryReadJSONValue(vJson : TJSONValue; valor : String) : String;
begin  try    Result := vJson.GetValue<string>(valor);  except    Result := '';  end;end;

procedure TfmCita.btnRandomUsersClick(Sender: TObject);
var
  vResultado      : String;  vJsonName       : TJSONValue;  vJsonLocation   : TJSONValue;  vJsonLogin      : TJSONValue;  vJsonRegistered : TJSONValue;  vJsonPicture    : TJSONValue;
begin
  dmRestRandomUser.EjecutarREST;
  vJsonName       := TJSONValue.ParseJSONValue(dmRestRandomUser.FDMemTable1.FieldByName('name').AsString);  vJsonLocation   := TJSONValue.ParseJSONValue(dmRestRandomUser.FDMemTable1.FieldByName('location').AsString);  vJsonLogin      := TJSONValue.ParseJSONValue(dmRestRandomUser.FDMemTable1.FieldByName('login').AsString);  vJsonRegistered := TJSONValue.ParseJSONValue(dmRestRandomUser.FDMemTable1.FieldByName('registered').AsString);  vJsonPicture    := TJSONValue.ParseJSONValue(dmRestRandomUser.FDMemTable1.FieldByName('picture').AsString);

  ShowMessage(
  TryReadJSONValue(vJsonName, 'title') + #13 +  TryReadJSONValue(vJsonName, 'first') + #13 +  TryReadJSONValue(vJsonName, 'last') + #13 +  TryReadJSONValue(vJsonLocation, 'street.number') + #13 +  TryReadJSONValue(vJsonLocation, 'street.name') + #13 +  TryReadJSONValue(vJsonLocation, 'city') + #13 +  TryReadJSONValue(vJsonLocation, 'state') + #13 +  TryReadJSONValue(vJsonLocation, 'country') + #13 +  TryReadJSONValue(vJsonLocation, 'postcode') + #13 +  dmRestRandomUser.FDMemTable1.FieldByName('email').AsString + #13 +  TryReadJSONValue(vJsonLogin, 'login.username') + #13 +  TryReadJSONValue(vJsonLogin, 'login.password') + #13 +  TryReadJSONValue(vJsonRegistered, 'registered.date') + #13 +  TryReadJSONValue(vJsonRegistered, 'registered.age') + #13 +  dmRestRandomUser.FDMemTable1.FieldByName('phone').AsString + #13 +  dmRestRandomUser.FDMemTable1.FieldByName('cell').AsString + #13 +  TryReadJSONValue(vJsonPicture, 'large') + #13 +  TryReadJSONValue(vJsonPicture, 'medium') + #13);

end;




end.
