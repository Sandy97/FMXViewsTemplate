unit LogView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  //uAppData,   // ���� ���������, ������ � ������ ����������
  AppViewTypes
  ;

type
  TFrmLog = class(TFormView)
    Rectangle1: TRectangle;
    Label1: TLabel;
    lytContents: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitView( View: TvmView; ViewHost: ILogViewHost; ParentControl: TControl ); override;
    procedure Enter( FromView: TvmView ); override;
    procedure Leave( ToView: TvmView ); override;
  end;

var
  FrmLog: TFrmLog;

implementation

{$R *.fmx}

{ TfrmFrmLog }


procedure TFrmLog.Enter(FromView: TvmView);
begin
  // init - �������� �� ������������ ����������� view
  // ��������: ReadLog;
end;

procedure TFrmLog.InitView(View: TvmView; ViewHost: ILogViewHost; ParentControl: TControl);
begin
  inherited;
  lytContents.Parent := ParentControl;
end;

procedure TFrmLog.Leave(ToView: TvmView);
begin
  // �������� �� ������� ��� ���������� ����������� view
  // ��������: ClearLog;
end;

end.
