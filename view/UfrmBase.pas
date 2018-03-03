unit UfrmBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,System.threading,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,UInterfaces, FMX.Ani,
  FMX.Effects,{$ifdef Android}AndroidApi.jni.toast,UWhatsapp,{$endif}Controller.FrmBase,
  FMX.TabControl;

type
  TFrmBase = class(TForm,IObservable)
    LayAll: TLayout;
    BgAll: TRectangle;
    LayTop: TLayout;
    LayBottom: TLayout;
    LayCenter: TLayout;
    LayBtnMenu: TLayout;
    BtnMenu: TButton;
    LayLogo: TLayout;
    LayTittle: TLayout;
    TextTitle: TText;
    MultiViewMenu: TMultiView;
    LayLoad: TLayout;
    ArcLoad: TArc;
    FloatArcRotationAngle: TFloatAnimation;
    FloatArcAngle: TFloatAnimation;
    Text1: TText;
    FloatTextLoad: TFloatAnimation;
    BgLoad: TRectangle;
    LayLoads: TLayout;
    BGTop: TRectangle;
    ShadowEffect1: TShadowEffect;
    LayAdd: TLayout;
    LayCenterBack: TLayout;
    CircleADD: TCircle;
    LaySubTitle: TLayout;
    BGBottom: TRectangle;
    BgSubTitle: TRectangle;
    Text2: TText;
    ShadowEffect2: TShadowEffect;
    TextAdd: TText;
    Text3: TText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    Controller:TControllerFrmBase;
    { Private declarations }
  public
   procedure ExecuteWork(Awork:IWork);
   procedure Update;Virtual;abstract;
   procedure ShowLoad;
   procedure HideLoad;
   procedure LongToast(AMessage:string);
   procedure ShortToast(AMessage:string);
   procedure EfectLabelUP(Sender:TObject);
  end;

var
  FrmBase: TFrmBase;

implementation

{$R *.fmx}

{ TFrmBase }

procedure TFrmBase.EfectLabelUP(Sender: TObject);
begin
Controller.EfectLabelUP.EfectTextEdit(Sender);
end;

procedure TFrmBase.ExecuteWork(Awork: IWork);
begin
ShowLoad;
  TThread.CreateAnonymousThread(procedure
  begin
  Awork.Execute;
  TThread.Synchronize(nil,procedure
    begin
      Self.HideLoad;
    end);
  end).Start;
end;

procedure TFrmBase.FormCreate(Sender: TObject);
begin
Controller:=TControllerFrmBase.create;
Controller.Observer.Add(Self);
end;

procedure TFrmBase.FormDestroy(Sender: TObject);
begin
Controller.Free;
end;

procedure TFrmBase.HideLoad;
begin
Layload.Visible:=false;
end;

procedure TFrmBase.LongToast(AMessage: string);
begin
 {$ifdef Android}
  Toast(Amessage,TToastLength.LongToast);
 {$endif}
end;

procedure TFrmBase.ShortToast(AMessage: string);
begin
{$ifdef Android}
 Toast(Amessage,TToastLength.ShortToast);
{$endif}
end;

procedure TFrmBase.ShowLoad;
begin
Layload.Visible:=true;
end;



initialization
ReportMemoryLeaksOnShutdown:=true;

end.
