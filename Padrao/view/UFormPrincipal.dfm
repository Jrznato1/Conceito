object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Aplica'#231#227'o para testes do Conceito de Padroniza'#231#227'o'
  ClientHeight = 526
  ClientWidth = 997
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 408
    Width = 394
    Height = 13
    Caption = 
      'CRUD = Create (Inserir) - Read (Consultar) - Update (Atualizar) ' +
      '- Delete (Apagar)'
  end
  object Button1: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Arquivos'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Conex'#245'es'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo: TMemo
    Left = 736
    Top = 26
    Width = 225
    Height = 159
    Lines.Strings = (
      'Memo')
    TabOrder = 2
  end
end
