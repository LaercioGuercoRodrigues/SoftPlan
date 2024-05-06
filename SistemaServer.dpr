program SistemaServer;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  U_FormMonitor in 'U_FormMonitor.pas' {Form1},
  ServerMethods in 'ServerMethods.pas' {ServerMethods1: TDSServerModule},
  ServerContainer in 'ServerContainer.pas' {ServerContainer1: TDataModule},
  WebModulepas in 'WebModulepas.pas' {WebModule1: TWebModule},
  U_DSSDM in 'U_DSSDM.pas' {DSSDM: TDSServerModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
