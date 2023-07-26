object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 166
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 93
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object RegisterBtn: TButton
    Left = 48
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Register'
    TabOrder = 0
    OnClick = RegisterBtnClick
  end
  object UnregisterBtn: TButton
    Left = 160
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Unregister'
    TabOrder = 1
    OnClick = UnregisterBtnClick
  end
  object SendBtn: TButton
    Left = 48
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Send Msg'
    TabOrder = 2
    OnClick = SendBtnClick
  end
end
