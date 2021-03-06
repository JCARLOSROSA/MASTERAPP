unit model.observer;

interface
uses
 UInterfaces,System.generics.collections;
Type
TObserver = class(TInterfacedObject,IObserver)
  private
    FListObservables: TList<IObservable>;
    procedure SetListObservables(const Value: TList<IObservable>);
  public
    procedure Add(Observable: IObservable);
    procedure Notify;
    procedure Remove(Observable: IObservable);
    constructor create;
    destructor destroy;override;
    property ListObservables:TList<IObservable> read FListObservables write SetListObservables;
end;

implementation

{ TObserver }

procedure TObserver.Add(Observable: IObservable);
begin
FListObservables.Add(Observable);
end;

constructor TObserver.create;
begin
 FListObservables:= TList<IObservable>.Create;
end;

destructor TObserver.destroy;
begin
FListObservables.Free;
  inherited;
end;

procedure TObserver.Notify;
 var
 Observable:IObservable;
begin
 for Observable in FListObservables do
 begin
   Observable.Update;
 end;
end;

procedure TObserver.Remove(Observable: IObservable);
begin
FListObservables.Remove(Observable);
end;

procedure TObserver.SetListObservables(const Value: TList<IObservable>);
begin
  FListObservables := Value;
end;

end.
