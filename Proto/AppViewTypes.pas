unit AppViewTypes;

interface

uses
  System.Classes,
  uAppData,
  FormViewTypes;

type
  // Enum ��� ������� View � ���� ����������
  TvmView = ( Startup, Settings, Log, Enter, Stats );

  // IViewHost - ��������� IFormViewHost � ��������� ��� ������������ ��������� ������� ����������
  ILogViewHost = interface( IFormViewHost )
    function AppData: TAppData;
    // ��������� ����������� ������� ������� ����������
  end;

  // �����-"view" ����� ���������� ������ ���� ������������ �� ILogViewHost
  TFormView = TBaseFormView<TvmView,ILogViewHost>;

  // view host ����� ������ �� ��������� ����� ���� ��� �������� ������ �� ������ view
  TFormViewArray = array[ TvmView ] of TFormView;


implementation

end.
