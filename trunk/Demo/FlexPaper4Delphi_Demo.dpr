program FlexPaper4Delphi_Demo;

uses
  Forms,
  untDemo in 'untDemo.pas' {Form2},
  untFlexPaper4Delphi in '..\untFlexPaper4Delphi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
