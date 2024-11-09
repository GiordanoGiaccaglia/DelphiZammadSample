program DelphiZammad;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uZammad in 'uZammad.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
