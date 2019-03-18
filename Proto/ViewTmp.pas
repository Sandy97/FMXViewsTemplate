unit StartupView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  //uAppData,   // ���� ���������, ������ � ������ ����������
  AppViewTypes
  ;

type
  Tfrm = class(TFormView)
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
  frm: Tfrm;

implementation

{$R *.fmx}

{ TfrmStartUp }


procedure Tfrm.Enter(FromView: TvmView);
begin
  // init - �������� �� ������������ ����������� view
  // ��������: UpdateStats;
end;

procedure Tfrm.InitView(View: TvmView; ViewHost: ILogViewHost; ParentControl: TControl);
begin
  inherited;
  lytContents.Parent := ParentControl;
end;

procedure Tfrm.Leave(ToView: TvmView);
begin
  // �������� �� ������� ��� ���������� ����������� view
  // ��������: ClearStats;
end;

end.
