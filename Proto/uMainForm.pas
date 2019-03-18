unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, FMX.Controls.Presentation, FMX.MultiView, System.Actions, FMX.ActnList,
  uAppData, AppViewTypes, FMX.StdCtrls

  ;

type
  TMainForm = class(TForm,ILogViewHost)
    mwSettings: TMultiView;
    layContent: TLayout;
    tbViews: TTabControl;
    tabStart: TTabItem;
    tabEnter: TTabItem;
    tabHistory: TTabItem;
    ActionList1: TActionList;
    actChangeTab: TChangeTabAction;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FAppData:TAppData;
    FViews: TFormViewArray;
    FCurrentFormView: TFormView;
    FEditSettingsSource: TvmView;
    procedure PopulateViews;
    procedure ChangeView( NewView: TvmView );
    { IFormViewHost  }
    procedure Back;
    procedure ShowSideBar;
    procedure EditSettings;
    procedure SettingsChanged;
    procedure ShowActivityPanel( const Msg: string );
    procedure HideActivityPanel;
    procedure ShowErrorPanel( const Msg: string );
    procedure HideErrorPanel;
    { ILogViewHost }
    function AppData: TAppData;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
uses
  startupView, LogView, StatsView
  ;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FAppData := TAppData.Create;
  FAppData.LoadSettings;

  HideActivityPanel;
  HideErrorPanel;

  mwSettings.Mode := TMultiViewMode.Drawer;
  tbViews.TabIndex := 0; // Startup View

  PopulateViews;

//  {$IF DEFINED(ANDROID) OR DEFINED(IOS)}
//  VKAutoShowMode := TVKAutoShowMode.Always;
//  {$ENDIF}
  actChangeTab.Transition := TTabTransition.Slide;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FAppData.Free;
end;

procedure TMainForm.PopulateViews;
begin
  FViews[ TvmView.Startup ] := TfrmStartUp.Create( Application );
  FViews[ TvmView.Startup ].InitView( TvmView.Startup, Self, tabStart );

  // FViews[ TvmView.Settings ] := TSettingsView.Create( Application );
  // FViews[ TvmView.Settings ].InitView( TvmView.Settings, Self, tabSettings );

  FViews[ TvmView.Log ] := TFrmLog.Create( Application );
  FViews[ TvmView.Log ].InitView( TvmView.Log, Self, tabEnter );

  FViews[ TvmView.Stats ] := TFrmStats.Create( Application );
  FViews[ TvmView.Stats ].InitView( TvmView.Stats, Self, tabHistory );

  FCurrentFormView := FViews[ TvmView.Startup ];
  FCurrentFormView.Enter( TvmView.Startup );
end;

procedure TMainForm.ChangeView(NewView: TvmView);
var
  PreviousView: TvmView;
begin
  PreviousView := FCurrentFormView.View;
  FCurrentFormView.Leave( NewView );

  FCurrentFormView := FViews[ NewView ];
  FCurrentFormView.Enter( PreviousView );

  actChangeTab.Tab := FCurrentFormView.ParentControl as TTabItem;
  actChangeTab.Execute;
end;

{= IViewHost Methods =}

procedure TMainForm.Back;
begin
  if FCurrentFormView.View = TvmView.Settings then
  begin
    ChangeView( FEditSettingsSource )
  end
  else if FCurrentFormView.View = TvmView.Stats then
  begin
    ChangeView( TvmView.Log );
  end;
end;

procedure TMainForm.ShowSideBar;
begin
  mwSettings.ShowMaster;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  mwSettings.ShowMaster;
end;

procedure TMainForm.EditSettings;
begin
  FEditSettingsSource := FCurrentFormView.View;
  ChangeView( TvmView.Settings );
end;

procedure TMainForm.SettingsChanged;
begin
  // Respond to any setting changes here
end;

procedure TMainForm.ShowActivityPanel( const Msg: string );
begin
//  lytActivityPanel.Align := TAlignLayout.Center;
//  txtActivityMessage.Text := Msg;
//  aniActivityIndicator.Enabled := True;
//
//  lytActivityPanel.Visible := True;
end;

procedure TMainForm.HideActivityPanel;
begin
//  aniActivityIndicator.Enabled := False;
//  lytActivityPanel.Visible := False;
end;

procedure TMainForm.ShowErrorPanel( const Msg: string );
begin
//  // lytErrorPanel.Align := TAlignLayout.Center;
//  txtErrorMessage.Text := Msg;
//
//  lytErrorPanel.Visible := True;
end;


procedure TMainForm.HideErrorPanel;
begin
//  lytErrorPanel.Visible := False;
end;

{-
procedure TMainForm.lytErrorPanelClick( Sender: TObject );
begin
  HideErrorPanel;
end;
-}

{= IAppViewHost Methods =}

function TMainForm.AppData: TAppData;
begin
  Result := FAppData;
end;

initialization
  ReportMemoryLeaksOnShutdown := TRUE;

end.
