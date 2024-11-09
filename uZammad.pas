{*******************************************************}
{                                                       }
{           KD SOFTWARE - GIORDANO GIACCAGLIA           }
{                 All rights reserved                   }
{              HTTPS://WWW.KDSOFTWARE.IT                }
{                       2024                            }
{                                                       }
{*******************************************************}

unit uZammad;

interface

uses
  System.Net.HttpClient, System.Net.URLClient, System.SysUtils, System.JSON,
  System.Classes;

type
  IZammad = Interface
    ['{A721ED4E-A083-44C2-A212-AE24D39572C9}']
    function CreateZammadUser(const Nome, Email, Password: string): string;
    function GetZammadTickets: TStringList;
    function CreateZammadTicket(const Titolo, Messaggio: string; UserNameMail: String): string;
  End;

  TZammad = class(TInterfacedObject,IZammad)
  public
    function CreateZammadUser(const Nome, Email, Password: string): string;
    function GetZammadTickets: TStringList;
    function CreateZammadTicket(const Titolo, Messaggio: string; UserNameMail: String): string;
  end;
implementation

{ TZammad }

function TZammad.CreateZammadTicket(const Titolo, Messaggio: string; UserNameMail: String): string;
var
  HttpClient: THTTPClient;
  RequestBody: TJSONObject;
  Response: IHTTPResponse;
  sStream:TStringStream;
begin
  HttpClient := THTTPClient.Create;
  try
    // Creiamo il JSON con i dati del ticket
    RequestBody := TJSONObject.Create;
    RequestBody.AddPair('title', Titolo);
    RequestBody.AddPair('group', 'Users');  // Specifica il gruppo o dipartimento
    RequestBody.AddPair('customer', UserNameMail);
    //RequestBody.AddPair('tipo', 'Altro');

    // Aggiungiamo un articolo (messaggio) iniziale al ticket
    var Article := TJSONObject.Create;
    Article.AddPair('subject', Titolo);
    Article.AddPair('body', Messaggio);
    Article.AddPair('type', 'note');
    Article.AddPair('internal', TJSONBool.Create(false));
    Article.AddPair('content_type', 'text/html');  // Tipo di contenuto
    RequestBody.AddPair('article', Article);

    // Impostiamo le intestazioni necessarie
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    HttpClient.CustomHeaders['Authorization'] := 'Bearer <tuo_token>';

    // Invio della richiesta POST
    try
      sStream := TStringStream.Create(RequestBody.ToJSON);
      Response := HttpClient.Post('https://<url_zammad>/api/v1/tickets', sStream);
    finally
      sStream.Free;
    end;

    if Response.StatusCode = 201 then
      Result := 'Ticket creato con successo'
    else
      Result := 'Errore nella creazione del ticket: ' + Response.StatusCode.ToString + ' ' + Response.StatusText + Response.ContentAsString;
  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function TZammad.CreateZammadUser(const Nome, Email, Password: string): string;
var
  HttpClient: THTTPClient;
  RequestBody: TJSONObject;
  Response: IHTTPResponse;
  sStream:TStringStream;
begin
  HttpClient := THTTPClient.Create;
  try
    // Creiamo il JSON con i dati dell'utente
    RequestBody := TJSONObject.Create;
    RequestBody.AddPair('firstname', Nome);
    RequestBody.AddPair('email', Email);
    RequestBody.AddPair('password', Password);

    // Impostiamo le intestazioni necessarie
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    HttpClient.CustomHeaders['Authorization'] := 'Bearer <tuo_token>';

    // Invio della richiesta POST
    try
      sStream := TStringStream.Create(RequestBody.ToJSON);
      Response := HttpClient.Post('https://<url_zammad>/api/v1/users', sStream);
    finally
      sStream.Free;
    end;

    if Response.StatusCode = 201 then
      Result := 'Utente creato con successo'
    else
      Result := 'Errore nella creazione dell’utente: ' + Response.StatusCode.ToString + ' ' + Response.StatusText;
  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function TZammad.GetZammadTickets: TStringList;
var
  HttpClient: THTTPClient;
  Response: IHTTPResponse;
  JSONData: TJSONArray;
  Ticket: TJSONObject;
  TicketList: TStringList;
  I: Integer;
begin
  HttpClient := THTTPClient.Create;
  TicketList := TStringList.Create;
  try
    // Impostiamo le intestazioni necessarie
    HttpClient.CustomHeaders['Authorization'] := 'Bearer <tuo_token>';

    // Invio della richiesta GET
    Response := HttpClient.Get('https://<url_zammad>/api/v1/tickets');

    if Response.StatusCode = 200 then
    begin
      JSONData := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONArray;
      try
        for I := 0 to JSONData.Count - 1 do
        begin
          Ticket := JSONData.Items[I] as TJSONObject;
          TicketList.Add('ID: ' + Ticket.GetValue('id').Value +
                         ' Titolo: ' + Ticket.GetValue('title').Value);
        end;
      finally
        JSONData.Free;
      end;
    end
    else
      TicketList.Add('Errore nel recupero dei ticket: ' + Response.StatusCode.ToString);
  finally
    HttpClient.Free;
  end;
  Result := TicketList;
end;

end.
