program FMXViewsTemplate;

uses
  System.StartUpCopy,
  FMX.Forms,
  uAppData in 'uAppData.pas',
  uMainForm in 'uMainForm.pas' {MainForm},
  AppViewTypes in 'AppViewTypes.pas',
  FormViewTypes in 'FormViewTypes.pas',
  StartupView in 'StartupView.pas' {frmStartUp},
  LogView in 'LogView.pas' {FrmLog},
  StatsView in 'StatsView.pas' {FrmStats};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
