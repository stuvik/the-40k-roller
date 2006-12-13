program My40KRoller;

uses
  Forms,
  UMain in 'UMain.pas' {fmMain},
  UHistory in 'UHistory.pas' {fmHistory},
  MT19937 in 'MT19937.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmHistory, fmHistory);
  Application.Run;
end.
