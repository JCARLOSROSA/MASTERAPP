unit UInterfaces;

interface

Type

IObservable = interface
 ['{E7D10654-D1DA-4E2F-8315-7BBC20D78DEA}']
 procedure Update;
end;

IObserver = interface
 ['{F18D185C-5706-4024-9B83-E88D9947DA97}']
 procedure Add(Observable:IObservable);
 procedure Remove(Observable:IObservable);
 procedure Notify;
end;

IEfect= Interface
  ['{3AFA7C88-AB7A-4551-989F-633A845DC863}']
  procedure EfectTextEdit(AObject:TObject);
End;

IWork = interface
  ['{8209DA24-F43D-4FD6-9560-1FE02CF26084}']
  procedure Execute;
end;

implementation

end.
