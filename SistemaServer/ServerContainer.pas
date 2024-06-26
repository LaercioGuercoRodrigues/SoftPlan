unit ServerContainer;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth;

type
  TServerContainer1 = class(TDataModule)
    DSServer1: TDSServer;
    DSServerClassDSSDM: TDSServerClass;
    procedure DSServerClassDSSDMGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
//    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
//      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

function DSServer: TDSServer;

implementation


{$R *.dfm}

uses
  ServerMethods, U_DSSDM;

var
  FModule: TComponent;
  FDSServer: TDSServer;

function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

constructor TServerContainer1.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServer1;
end;

destructor TServerContainer1.Destroy;
begin
  inherited;
  FDSServer := nil;
end;

procedure TServerContainer1.DSServerClassDSSDMGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
   PersistentClass := U_DSSDM.TDSSDM;
end;

//procedure TServerContainer1.DSServerClass1GetClass(
//  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
//begin
//  //PersistentClass := ServerMethods.TServerMethods1;
//end;

initialization
  FModule := TServerContainer1.Create(nil);
finalization
  FModule.Free;
end.

