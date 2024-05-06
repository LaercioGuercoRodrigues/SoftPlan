unit U_DMServer;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  Data.DbxHTTPLayer, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.DSConnect, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.DS,
  FireDAC.Phys.DSDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, U_Crud,
  Vcl.Forms;

type
  TDMServer = class(TDataModule)
    SQLConnection: TSQLConnection;
    DSProviderConnectionDSSDM: TDSProviderConnection;
    CDSEndereco: TClientDataSet;
    CDSListaEndereco: TClientDataSet;
    CDSListaEnderecoid_endereco: TLargeintField;
    CDSListaEnderecocep: TStringField;
    CDSListaEnderecologradouro: TStringField;
    CDSListaEnderecocomplemento: TStringField;
    CDSListaEnderecobairro: TStringField;
    CDSListaEnderecolocalidade: TStringField;
    CDSListaEnderecouf: TStringField;
    CDSEnderecoid_endereco: TLargeintField;
    CDSEnderecocep: TStringField;
    CDSEnderecologradouro: TStringField;
    CDSEnderecocomplemento: TStringField;
    CDSEnderecobairro: TStringField;
    CDSEnderecolocalidade: TStringField;
    CDSEnderecouf: TStringField;
    FDConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Crud : TCrud;
    glbCep, glbUf, glbLocalidade, glbLogradouro  : String;
    procedure ExibirForm(FrmCad: TFormClass);
  end;

var
  DMServer: TDMServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMServer.DataModuleCreate(Sender: TObject);
begin
   Crud:=TCrud.Create;
end;

procedure TDMServer.ExibirForm(FrmCad: TFormClass);
var
  Form : TForm;
begin
   try
     Form:=FrmCad.Create(nil);
     Form.ShowModal
   finally
     FreeAndNil(Form);
   end;
end;

end.
