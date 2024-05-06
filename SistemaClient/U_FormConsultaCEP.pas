unit U_FormConsultaCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FormPadraoConsulta, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormConsultaCEP = class(TFormPadraoConsulta)
    LabelPesquisa: TLabel;
    EditDado: TEdit;
    BitBtnObterCep: TBitBtn;
    procedure BitBtnObterCepClick(Sender: TObject);
    procedure BitBtnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridConsultaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaCEP: TFormConsultaCEP;

implementation

{$R *.dfm}

uses U_FormConsultaCEPApi, U_DMRest, U_DMServer, Datasnap.DBClient,
     U_FormCadastroCEP;


procedure TFormConsultaCEP.BitBtnObterCepClick(Sender: TObject);
begin
  inherited;
  DMServer.ExibirForm(TFormConsultaCEPApi);
end;

procedure TFormConsultaCEP.BitBtnPesquisarClick(Sender: TObject);
begin
  TClientDataSet(DataSourceConsulta.DataSet).Params[0].AsString:='%' + EditDado.Text + '%';
  TClientDataSet(DataSourceConsulta.DataSet).Params[1].AsString:='%' + EditDado.Text + '%';
  inherited;

end;

procedure TFormConsultaCEP.DBGridConsultaCellClick(Column: TColumn);
begin
  inherited;
  DMServer.glbCep        := TClientDataSet(DataSourceConsulta.DataSet).Fields[1].AsString;
  DMServer.glbUf         := TClientDataSet(DataSourceConsulta.DataSet).Fields[6].AsString;
  DMServer.glbLocalidade := TClientDataSet(DataSourceConsulta.DataSet).Fields[5].AsString;
  DMServer.glbLogradouro := TClientDataSet(DataSourceConsulta.DataSet).Fields[2].AsString;
end;

procedure TFormConsultaCEP.FormShow(Sender: TObject);
begin
  FormCadastro:=TFormCadastroCEP;
  inherited;
  DMServer.glbCep        := '';
  DMServer.glbUf         := '';
  DMServer.glbLocalidade := '';
  DMServer.glbLogradouro := '';
end;

end.
