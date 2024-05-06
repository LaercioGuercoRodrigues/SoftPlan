unit U_FormPadraoConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FormPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TFormPadraoConsulta = class(TFormPadrao)
    PanelTopo: TPanel;
    PanelParametros: TPanel;
    DBGridConsulta: TDBGrid;
    PanelBase: TPanel;
    DataSourceConsulta: TDataSource;
    BitBtnFechar: TBitBtn;
    BitBtnImprimir: TBitBtn;
    BitBtnExcluir: TBitBtn;
    BitBtnAlterar: TBitBtn;
    BitBtnIncluir: TBitBtn;
    BitBtnPesquisar: TBitBtn;
    DataSourceCadastro: TDataSource;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure BitBtnPesquisarClick(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnAlterarClick(Sender: TObject);
    procedure BitBtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FormCadastro : TFormClass;
    //procedure ExibirCadastro(FrmCad: TFormClass);
  end;

var
  FormPadraoConsulta: TFormPadraoConsulta;

implementation


{$R *.dfm}

uses U_DMServer;

//procedure TFormPadraoConsulta.ExibirCadastro(FrmCad: TFormClass);
//var
//  Form : TForm;
//begin
//   try
//     Form:=FrmCad.Create(Self);
//     Form.ShowModal
//   finally
//     FreeAndNil(Form);
//   end;
//end;

procedure TFormPadraoConsulta.BitBtnAlterarClick(Sender: TObject);
begin
  inherited;
  DMServer.Crud.ObterRegistro('A', TClientDataSet(DataSourceCadastro.DataSet), TClientDataSet(DataSourceConsulta.DataSet).Fields[0].AsLargeInt);
  DMServer.ExibirForm(FormCadastro);
end;

procedure TFormPadraoConsulta.BitBtnExcluirClick(Sender: TObject);
begin
  inherited;
  DMServer.Crud.ObterRegistro('E', TClientDataSet(DataSourceCadastro.DataSet), TClientDataSet(DataSourceConsulta.DataSet).Fields[0].AsLargeInt);
  DMServer.ExibirForm(FormCadastro);
end;

procedure TFormPadraoConsulta.BitBtnImprimirClick(Sender: TObject);
begin
  inherited;
  //Implementar
end;

procedure TFormPadraoConsulta.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  DMServer.Crud.ObterRegistro('I', TClientDataSet(DataSourceCadastro.DataSet), -1);
  DMServer.ExibirForm(FormCadastro);
end;

procedure TFormPadraoConsulta.BitBtnFecharClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFormPadraoConsulta.BitBtnPesquisarClick(Sender: TObject);
begin
  inherited;
  TClientDataSet(DataSourceConsulta.DataSet).Close;
  TClientDataSet(DataSourceConsulta.DataSet).Open;
end;

end.
