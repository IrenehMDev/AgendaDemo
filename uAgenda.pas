unit uAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Datasnap.DBClient;

type
  TfmAgenda = class(TForm)
    Panel1: TPanel;
    btnNueva: TButton;
    btnEditat: TButton;
    btnEliminar: TButton;
    btnImprime: TButton;
    btnBuscar: TButton;
    btnActualiza: TButton;
    btnSalir: TButton;
    GroupBox1: TGroupBox;
    MonthCalendar: TMonthCalendar;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    gridCitas: TDBGrid;
    Button1: TButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    dsEmpleado: TDataSource;
    dscCitas: TDataSource;
    cbxDpto: TDBComboBox;
    procedure btnNuevaClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure MonthCalendarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAgenda: TfmAgenda;

implementation
uses uCita, uConnection;

{$R *.dfm}

procedure TfmAgenda.btnNuevaClick(Sender: TObject);
begin
    fmCita.ShowModal;
end;

procedure TfmAgenda.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAgenda.FormShow(Sender: TObject);
begin
  //Al mostrar la forma va traer todas las citas en la tabla de Citas
  dmConnection.qryCitas.Close;
  dmConnection.qryCitas.SQL.Text :=
      'select * from Cita where fecha = :xFecha';
  dmConnection.qryCitas.ParamByName('xFecha').AsDate := Trunc(Now());
  dmConnection.qryCitas.Open;

end;

procedure TfmAgenda.MonthCalendarClick(Sender: TObject);
begin
  // Cuando el usuario seleccioneunja fecha, hacer el query de citas
  // para ese dia en particular
  dmConnection.qryCitas.Close;
  dmConnection.qryCitas.SQL.Text :=
      'select * from Cita where fecha = :xFecha';
  dmConnection.qryCitas.ParamByName('xFecha').AsDate := MonthCalendar.Date;
  dmConnection.qryCitas.Open;

end;

end.
