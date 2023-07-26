unit mainfrm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  intf.messages;

type
  TForm1 = class( TForm )
    RegisterBtn: TButton;
    UnregisterBtn: TButton;
    SendBtn: TButton;
    Label1: TLabel;
    procedure RegisterBtnClick(Sender: TObject);
    procedure UnregisterBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SendBtnClick(Sender: TObject);
  private
    { Private declarations }
    FMsgManager: IMsgManager;
    oMsgHandler: ISubscription;
  public
    { Public declarations }
    property MsgManager: IMsgManager read FMsgManager;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  provider.messages;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FMsgManager := TMsgManager.Create;
end;

procedure TForm1.RegisterBtnClick(Sender: TObject);
begin
  // register a handler for a message
  oMsgHandler := MsgManager.SubscribeTo( TMsgExampleText,
    procedure( const Sender: TObject; const AMessage: TMessage )
    begin
      Label1.Caption := ( AMessage as TMsgExampleText ).Value;
    end );
end;

procedure TForm1.SendBtnClick(Sender: TObject);
begin
  // before sending the message, clear the label so we can see the message arriving
  Label1.Caption := '--';
  MsgManager.SendMsg( TMsgExampleText.Create( 'This is a test message' ) );
end;

procedure TForm1.UnregisterBtnClick(Sender: TObject);
begin
  // de-register message handler
  oMsgHandler := nil;
end;

end.
