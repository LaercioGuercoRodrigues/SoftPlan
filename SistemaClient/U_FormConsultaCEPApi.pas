unit U_FormConsultaCEPApi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FormPadraoConsulta, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormConsultaCEPApi = class(TFormPadraoConsulta)
    RadioGroupFormato: TRadioGroup;
    BitBtnObterCep: TBitBtn;
    BitBtnObterEndereco: TBitBtn;
    MemoConteudoCep: TMemo;
    MemoConteudoEndereco: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtnObterCepClick(Sender: TObject);
    procedure BitBtnObterEnderecoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaCEPApi: TFormConsultaCEPApi;

implementation

{$R *.dfm}

uses U_DMRest, U_DMServer, U_FormCadastroCEP, U_Crud, Datasnap.DBClient;

procedure TFormConsultaCEPApi.BitBtnIncluirClick(Sender: TObject);
var
  Crud : TCrud;
begin
  //inherited;

  if DMRest.CDSCep.RecordCount = 0 then
     Exit;

  DMServer.CDSListaEndereco.Close;
  DMServer.CDSListaEndereco.Params[0].AsString:='%' + MemoConteudoCep.Text + '%';
  DMServer.CDSListaEndereco.Params[1].AsString:='%' + MemoConteudoEndereco.Text + '%';
  DMServer.CDSListaEndereco.Open;

  Crud := TCrud.Create;

  if DMServer.CDSListaEndereco.RecordCount = 0 then
     begin
       Crud.ObterRegistro('I', TClientDataSet(DataSourceCadastro.DataSet), -1);
     end
  else
    begin
       Crud.ObterRegistro('A', TClientDataSet(DataSourceCadastro.DataSet), DMServer.CDSListaEnderecoid_endereco.AsLargeInt);
    end;

  TClientDataSet(DataSourceCadastro.DataSet).FieldByName('cep').asstring:=DMRest.CDSCepCep.AsString;
  TClientDataSet(DataSourceCadastro.DataSet).FieldByName('logradouro').asstring:=DMRest.CDSCepLogradouro.AsString;
  TClientDataSet(DataSourceCadastro.DataSet).FieldByName('complemento').asstring:=DMRest.CDSCepComplemento.AsString + ' teste';
  TClientDataSet(DataSourceCadastro.DataSet).FieldByName('bairro').asstring:=DMRest.CDSCepbairro.AsString;
  TClientDataSet(DataSourceCadastro.DataSet).FieldByName('localidade').asstring:=DMRest.CDSCepLocalidade.AsString;
  TClientDataSet(DataSourceCadastro.DataSet).FieldByName('bairro').asstring:=DMRest.CDSCepbairro.AsString;
  TClientDataSet(DataSourceCadastro.DataSet).FieldByName('uf').asstring:=DMRest.CDSCepUf.AsString;

  Crud.ConfirmarOperacao(TClientDataSet(DMServer.CDSEndereco));

  Crud.Free;

end;

procedure TFormConsultaCEPApi.BitBtnObterCepClick(Sender: TObject);
begin
  inherited;
  DMRest.ObterCepPorEndereco(DMRest.BaseURLApiViaCep,
                             MemoConteudoEndereco.Text,
                             RadioGroupFormato.Items[RadioGroupFormato.ItemIndex].ToLower);
end;

procedure TFormConsultaCEPApi.BitBtnObterEnderecoClick(Sender: TObject);
begin
  inherited;
  DMRest.ObterEnderecoPorCep(DMRest.BaseURLApiViaCep,
                             MemoConteudoCep.Text,
                             RadioGroupFormato.Items[RadioGroupFormato.ItemIndex].ToLower);
end;

procedure TFormConsultaCEPApi.FormShow(Sender: TObject);
begin
  FormCadastro:=TFormCadastroCEP;
  inherited;
  MemoConteudoCep.Text:=DMServer.glbCep;
  MemoConteudoEndereco.Text:=DMServer.glbUf + '/' + DMServer.glbLocalidade + '/' + DMServer.glbLogradouro;
end;

end.
