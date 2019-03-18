unit uAppData;

interface

type
  TLogMode = (Single, Average, Max, Loop);

  TAppData = class
  private const
    DefaultPatID: string = 'ABC';
    DefaultAvgRetry: integer = 3;
    DefaultLogFName: string = 'ADLog.json';
    SettingsFileName: string = 'ADLog.ini';
  public const
  private
    FSettingsPath: string;
    FPatName: string;
    FNumRetry: integer;
    FLogFile: string;
    FLogMode: TLogMode;
    procedure SetLogFile(const Value: string);
    procedure SetLogMode(const Value: TLogMode);
    procedure SetNumRetry(const Value: integer);
    procedure SetPatName(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadSettings;
    procedure SaveSettings;
    property PatName: string read FPatName write SetPatName;
    property LogFile: string read FLogFile write SetLogFile;
    property LogMode: TLogMode read FLogMode write SetLogMode;
    property NumRetry: integer read FNumRetry write SetNumRetry;
  end;

implementation

uses
  System.SysUtils, System.IOUtils, System.IniFiles;

{ TAppData }

constructor TAppData.Create;
begin
  inherited;
  FSettingsPath := TPath.GetDocumentsPath + System.SysUtils.PathDelim;
  FLogFile := FSettingsPath + DefaultLogFName;
  FNumRetry := DefaultAvgRetry;
  FPatName := DefaultPatID;
  FLogMode := TLogMode.Single;
end;

destructor TAppData.Destroy;
begin
  inherited;
end;

procedure TAppData.LoadSettings;
var
  IniFile: TMemIniFile;
begin
  IniFile := TMemIniFile.Create(FSettingsPath + SettingsFileName);
  try
    FPatName := IniFile.ReadString('Settings', 'PatName', DefaultPatID);
    FLogFile := IniFile.ReadString('Settings', 'LogFile', DefaultLogFName);
    // FLogMode := IniFile.ReadInteger( 'Settings', 'LogMode', TLogMode.Single );
    FNumRetry := IniFile.ReadInteger('Settings', 'Retry', DefaultAvgRetry);
    IniFile.UpdateFile;
  finally
    IniFile.Free;
  end;
end;

procedure TAppData.SaveSettings;
var
  IniFile: TMemIniFile;
begin
  IniFile := TMemIniFile.Create(FSettingsPath + SettingsFileName);
  try
    IniFile.WriteInteger('Settings', 'Retry', FNumRetry);
    IniFile.WriteString('Settings', 'LogFile', FLogFile);
    IniFile.WriteString('Settings', 'PatName', FPatName);
    // IniFile.WriteString( 'Settings', 'LogMode', FLogMode );
    IniFile.UpdateFile;
  finally
    IniFile.Free;
  end;
end;

procedure TAppData.SetLogFile(const Value: string);
begin
  FLogFile := Value;
end;

procedure TAppData.SetLogMode(const Value: TLogMode);
begin
  FLogMode := Value;
end;

procedure TAppData.SetNumRetry(const Value: integer);
begin
  FNumRetry := Value;
end;

procedure TAppData.SetPatName(const Value: string);
begin
  FPatName := Value;
end;

end.
