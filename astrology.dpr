program astrology;

uses
  Vcl.Forms,
  MemberSetting in 'MemberSetting.pas' {Form1},
  MainFrame in 'MainFrame.pas' {Form2},
  CitySetting in 'CitySetting.pas' {Form3},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
