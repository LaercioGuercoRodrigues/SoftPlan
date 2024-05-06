unit U_DMRest;

interface

uses
  System.Classes, Xml.xmldom, REST.Types, REST.Client,
  REST.Authenticator.Basic, Data.Bind.Components, Data.Bind.ObjectScope,
  Datasnap.Provider, Datasnap.Xmlxform, Data.DB, Datasnap.DBClient,

  System.JSON;

type
  TDMRest = class(TDataModule)
    XMLTransformProvider: TXMLTransformProvider;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    HTTPBasicAuthenticator: THTTPBasicAuthenticator;
    CDSCep: TClientDataSet;
    CDSCepCep: TStringField;
    CDSCepLogradouro: TStringField;
    CDSCepComplemento: TStringField;
    CDSCepbairro: TStringField;
    CDSCepLocalidade: TStringField;
    CDSCepUf: TStringField;
    CDSCepibge: TStringField;
    CDSCepgia: TStringField;
    CDSCepddd: TStringField;
    CDSCepsiafi: TStringField;
  private

    { Private declarations }
  public
    { Public declarations }
    const BaseURLApiViaCep : string = 'https://viacep.com.br/ws/';
    procedure GetXML(BaseURL, Resource, NomeXTR: String);
    function  Get(BaseURL : String; Resource: String) : String;
    procedure ObterCepPorEndereco(BaseURL : String; Resource: String; Formato : String);
    procedure ObterEnderecoPorCep(BaseURL : String; Resource: String; Formato : String);
  end;

var
  DMRest: TDMRest;

implementation

uses
  System.SysUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDMRest.Get(BaseURL : String; Resource: String) : String;
begin
   try
      RESTClient.BaseURL:=BaseURL;
      RESTRequest.Resource:=Resource;
      RESTRequest.Method := rmGET;
      RESTRequest.Execute;
      case RESTResponse.StatusCode of
        200:
          begin
              Result:=RESTResponse.Content;
          end;
        400:
          begin
              Result:=RESTResponse.Content;
          end;
      end;
   except
      Result:=RESTResponse.Content;
   end;
end;

procedure TDMRest.ObterCepPorEndereco(BaseURL, Resource, Formato: String);
var
  JsonValue : TJsonValue;
  i, j : integer;
  strJeson, formatoResource, caminho : string;
  jsonRaiz : TJSONObject;
  jsArray : TJSONArray;
  jsonObject : TJSONObject;
begin
    if Formato = 'json' then
       begin
          formatoResource:=Trim(Resource) + '/' + Formato;
          strJeson:=Get(BaseURL, formatoResource);
          //strJeson:='{"root":[' + strJeson + ']}';
          strJeson:='{"root":' + strJeson + '}';
          strJeson:=strJeson.ToLower;
          JsonValue := TJSonObject.ParseJSONValue(strJeson);
          jsonRaiz := TJSONObject.ParseJSONValue(strJeson) as TJSONObject;
          if(jsonRaiz <> nil)then
              begin
                  CDSCep.EmptyDataSet;
                  jsArray := jsonRaiz.GetValue<TJSONArray>('root') as TJSONArray;
                  for i := 0 to jsArray.Count - 1 do
                      begin
                        jsonObject := jsArray.Items[i] as TJSONObject;
                        CDSCep.Append;
                        for j := 0 to CDSCep.FieldCount - 1 do
                            begin
                               CDSCep.Fields[j].Value:=
                                   StringReplace(jsonObject.GetValue(CDSCep.Fields[j].FieldName.ToLower).ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);
                            end;
                         CDSCep.Post;
                      end;
              end;
       end
   else
   if Formato = 'xml' then
      begin
         formatoResource:=Trim(Resource) + '/' + Formato;
         caminho:= ParamStr(0);
         caminho:=ExtractFilePath(caminho);
         caminho:=caminho + 'xtr\CepEndToDp.xtr';
         DMRest.GetXML(BaseURL, formatoResource, caminho);
      end;
end;

procedure TDMRest.ObterEnderecoPorCep(BaseURL, Resource, Formato: String);
var
   JSonValue:TJSonValue;
   strJeson, formatoResource, caminho : string;
   j : integer;
begin
   if Formato = 'json' then
       begin
           formatoResource:=Trim(Resource) + '/' + Formato;
           strJeson:=Get(BaseURL, formatoResource);
           JsonValue := TJSonObject.ParseJSONValue(strJeson);
           CDSCep.EmptyDataSet;
           CDSCep.Append;
           for j := 0 to CDSCep.FieldCount - 1 do
              begin
                 CDSCep.Fields[j].Value:=JsonValue.GetValue<string>(CDSCep.Fields[j].FieldName.ToLower);
              end;
           CDSCep.Post;
       end
   else
   if Formato = 'xml' then
      begin
         formatoResource:=Trim(Resource) + '/' + Formato;
         caminho:= ParamStr(0);
         caminho:=ExtractFilePath(caminho);
         caminho:=caminho + 'xtr\CepToDp.xtr';
         DMRest.GetXML(BaseURL, formatoResource, caminho);
      end;
end;

procedure TDMRest.GetXML(BaseURL : String; Resource : string; NomeXTR : String);
var
  JXML: OleVariant;
begin
      RESTClient.BaseURL:=BaseURL;
      RESTRequest.Resource := Resource;
      RESTRequest.Method := rmGET;
      RESTRequest.Execute;
      case RESTResponse.StatusCode of
        200:
          begin
              JXML:=RESTResponse.Content;
              CDSCep.Close;
              CDSCep.providerName:= 'XMLTransformProvider';
              XMLTransformProvider.TransformRead.TransformationFile:=NomeXTR;
              CDSCep.XMLData:=XMLTransformProvider.TransformRead.TransformXML(JXML);
          end;
      end;
end;

end.
