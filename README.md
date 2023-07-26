# delphi-messaging

This is a small example and associated files that I use for messaging between Delphi modules.

The main purpose is to promote decoupling between modules.  In this tiny example, only one message is defined
but in bigger systems, it is helpful to only have one module (intf.messages.pas) which is dependent on the
interfaces that other modules offer.

The application provides a simple form with buttons to register a message handler, unregister it (when you
no longer want to receive the message, e.g. when the focus of your app has changed) and send a hard-coded message.

I use interfaces for the message subscriptions because I like the convenience of being able to hold on to
the subscription object until I no longer need it and then just dispose of it.  Always declare the ISubscription
object as a module-global variable (i.e. not in the subscription function), otherwise, the subscription will be
de-registered as soon as you leave the registration function.

