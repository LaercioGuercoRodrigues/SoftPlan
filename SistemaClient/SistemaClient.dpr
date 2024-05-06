program SistemaClient;

uses
  Vcl.Forms,
  U_FormPadrao in 'ClassesPadrao\U_FormPadrao.pas' {FormPadrao},
  U_FormPadraoConsulta in 'ClassesPadrao\U_FormPadraoConsulta.pas' {FormPadraoConsulta},
  U_FormPadraoCadastro in 'ClassesPadrao\U_FormPadraoCadastro.pas' {FormPadraoCadastro},
  U_FormPrincipal in 'U_FormPrincipal.pas' {FormPrincipal},
  U_DMRest in 'U_DMRest.pas' {DMRest: TDataModule},
  U_FormConsultaCEP in 'U_FormConsultaCEP.pas' {FormConsultaCEP},
  U_FormConsultaCEPApi in 'U_FormConsultaCEPApi.pas' {FormConsultaCEPApi},
  U_DMServer in 'U_DMServer.pas' {DMServer: TDataModule},
  U_Crud in 'ClassesPadrao\U_Crud.pas',
  U_FormCadastroCEP in 'U_FormCadastroCEP.pas' {FormCadastroCEP};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDMRest, DMRest);
  Application.CreateForm(TDMServer, DMServer);
  Application.Run;
end.
