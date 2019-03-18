unit AppViewTypes;

interface

uses
  System.Classes,
  uAppData,
  FormViewTypes;

type
  // Enum для каждого View в этом приложении
  TvmView = ( Startup, Settings, Log, Enter, Stats );

  // IViewHost - наследник IFormViewHost и расширяет его специальными функциями данного приложения
  ILogViewHost = interface( IFormViewHost )
    function AppData: TAppData;
    // некоторые специальные функции данного приложения
  end;

  // Формы-"view" этого приложения должны быть наследниками от ILogViewHost
  TFormView = TBaseFormView<TvmView,ILogViewHost>;

  // view host имеет массив из элементов этого типа для хранения ссылки на каждый view
  TFormViewArray = array[ TvmView ] of TFormView;


implementation

end.
