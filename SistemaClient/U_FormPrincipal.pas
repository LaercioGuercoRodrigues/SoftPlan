unit U_FormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FormPadrao, Vcl.Menus;

type
  TFormPrincipal = class(TFormPadrao)
    MainMenu: TMainMenu;
    mnuConsultas: TMenuItem;
    mnuEndereo: TMenuItem;
    procedure mnuEndereoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses U_FormConsultaCEP;

procedure TFormPrincipal.mnuEndereoClick(Sender: TObject);
begin
  inherited;
  try
    Application.CreateForm(TFormConsultaCEP, FormConsultaCEP);
    FormConsultaCEP.ShowModal;
  finally
    FormConsultaCEP.Free;
  end;
end;

end.
