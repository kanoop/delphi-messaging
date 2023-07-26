unit intf.messages;

interface

uses
  System.Types,
  System.Classes,
  System.Messaging;

type
  ISubscription = interface
    [ '{58B5220A-32CD-4DB4-8265-08754EC0E14A}' ]
  end;

  IMsgManager = interface
    [ '{65EBF801-57AE-428C-8CC7-71E86E66E918}' ]
    procedure SendMsg( const AMessage: TMessage );
    function SubscribeTo( const AMessageClass: TClass; const AListener: TMessageListener ): ISubscription;
  end;

  TMessage = System.Messaging.TMessage;

  TMsgExampleText = class( TMessage<string> );

implementation

end.
