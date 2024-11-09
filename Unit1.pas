unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  uZammad,ShellApi;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    e_username: TLabeledEdit;
    e_mail: TLabeledEdit;
    e_password: TLabeledEdit;
    Button1: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    Button2: TButton;
    GroupBox2: TGroupBox;
    e_titolo: TLabeledEdit;
    Button3: TButton;
    m_messaggio: TMemo;
    Label2: TLabel;
    e_mailTicket: TLabeledEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
    FZammad:IZammad;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  ResStrng: string;
begin
  ResStrng := FZammad.CreateZammadUser(e_username.Text,e_mail.Text,e_password.Text);

  Showmessage(ResStrng);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  SL:TStringList;
begin
  try
    SL := FZammad.GetZammadTickets;
    ListBox1.Items.Assign(SL);
  finally
    SL.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  ResStrng: string;
begin
  ResStrng := FZammad.CreateZammadTicket(e_titolo.Text,m_messaggio.Lines.Text,e_mailTicket.Text);

  Showmessage(ResStrng);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FZammad := TZammad.Create;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  ShellExecute(0,'open','https://www.kdsoftware.it',nil,nil,SW_SHOWNORMAL)
end;

end.
