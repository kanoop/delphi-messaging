unit provider.messages;

interface

uses
  System.Messaging,
  intf.messages;

type
  TMsgManager = class( TInterfacedObject, IMsgManager )
  public
    procedure SendMsg( const AMessage: TMessage );
    function SubscribeTo( const AMessageClass: TClass; const AListener: TMessageListener ): ISubscription;
  end;

implementation

uses
  System.Threading;

type
  TSubscription = class( TInterfacedObject, ISubscription )
  private
    xClass: TClass;
    iID   : integer;
  public
    destructor Destroy; override;
    procedure SubscribeTo( const AMessageClass: TClass; const AListener: TMessageListener );
  end;

{ TMsgManager }

procedure TMsgManager.SendMsg( const AMessage: TMessage );
begin
  // this variant sends AND FREES the message
  TMessageManager.DefaultManager.SendMessage( nil, AMessage );
end;

function TMsgManager.SubscribeTo( const AMessageClass: TClass; const AListener: TMessageListener ): ISubscription;
var
  oRes: TSubscription;
begin
  oRes := TSubscription.Create;
  oRes.SubscribeTo( AMessageClass, AListener );

  result := oRes;
end;

{ TSubscription }

destructor TSubscription.Destroy;
begin
  TMonitor.Enter( TMessageManager.DefaultManager );
  try
    TMessageManager.DefaultManager.Unsubscribe( xClass, iID );
  finally
    TMonitor.Exit( TMessageManager.DefaultManager );
  end;
  inherited;
end;

procedure TSubscription.SubscribeTo( const AMessageClass: TClass; const AListener: TMessageListener );
begin
  xClass := AMessageClass;
  TMonitor.Enter( TMessageManager.DefaultManager );
  try
    iID := TMessageManager.DefaultManager.SubscribeToMessage( AMessageClass, AListener );
  finally
    TMonitor.Exit( TMessageManager.DefaultManager );
  end;
end;

end.
