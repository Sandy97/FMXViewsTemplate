unit FormViewTypes;

interface

uses
  System.Classes,
  FMX.Controls, FMX.Forms;

type
  IFormViewHost = interface
    procedure Back;
    procedure ShowSideBar;
    procedure EditSettings;
    procedure SettingsChanged;
    procedure ShowActivityPanel( const Msg: string );
    procedure HideActivityPanel;
    procedure ShowErrorPanel( const Msg: string );
    procedure HideErrorPanel;
  end;


  IFormView<T,IVH> = interface
    procedure InitView( View: T; ViewHost: IVH; ParentControl: TControl );
    function View: T;
    function ViewHost: IVH;
    function ParentControl: TControl;
    procedure Enter( FromView: T );
    procedure Leave( ToView: T );
  end;


  TBaseFormView<T,IVH> = class( TForm, IFormView<T,IVH> )
  private
    FView: T;
    FViewHost: IVH;
    FParentControl: TControl;
  public
    procedure InitView( View: T; ViewHost: IVH; ParentControl: TControl ); virtual;
    function View: T; inline;
    function ViewHost: IVH; inline;
    function ParentControl: TControl; inline;
    procedure Enter( FromView: T ); virtual;
    procedure Leave( ToView: T ); virtual;
  end;


implementation

procedure TBaseFormView<T,IVH>.InitView( View: T; ViewHost: IVH; ParentControl: TControl );
begin
  FView := View;
  FViewHost := ViewHost;
  FParentControl := ParentControl;
end;


function TBaseFormView<T,IVH>.View: T;
begin
  Result := FView;
end;


function TBaseFormView<T,IVH>.ViewHost: IVH;
begin
  Result := FViewHost;
end;


function TBaseFormView<T,IVH>.ParentControl: TControl;
begin
  Result := FParentControl;
end;


procedure TBaseFormView<T,IVH>.Enter( FromView: T );
begin
  // Overridden in descendant classes
end;


procedure TBaseFormView<T,IVH>.Leave( ToView: T );
begin
  // Overridden in descendant classes
end;


end.
