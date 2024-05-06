unit U_FormPadraoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FormPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Datasnap.DBClient;

type
  TFormPadraoCadastro = class(TFormPadrao)
    PanelTopo: TPanel;
    BitBtnConfirmar: TBitBtn;
    BitBtnCancelar: TBitBtn;
    BitBtnFechar: TBitBtn;
    PanelCampos: TPanel;
    DataSourceCadastro: TDataSource;
    procedure BitBtnConfirmarClick(Sender: TObject);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPadraoCadastro: TFormPadraoCadastro;

implementation

uses U_DMServer;

{$R *.dfm}

procedure TFormPadraoCadastro.BitBtnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFormPadraoCadastro.BitBtnConfirmarClick(Sender: TObject);
begin
  inherited;
  DMServer.Crud.ConfirmarOperacao(TClientDataSet(DataSourceCadastro.DataSet));
  Self.Close;
end;

procedure TFormPadraoCadastro.BitBtnFecharClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

end.
