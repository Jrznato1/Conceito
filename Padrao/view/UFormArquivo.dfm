object frmArquivos: TfrmArquivos
  Left = 0
  Top = 0
  Caption = 'Tela de testes da classe TArquivo'
  ClientHeight = 436
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Dialog'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Path'
    TabOrder = 1
  end
  object Memo: TMemo
    Left = 392
    Top = 48
    Width = 281
    Height = 241
    Lines.Strings = (
      'Memo')
    TabOrder = 2
  end
  object dgArquivos: TOpenDialog
    Filter = 'Any|*.*'
    Left = 96
    Top = 288
  end
  object dgImagens: TOpenDialog
    Filter = 
      'Bitmap|*.bmp|Jpg|*.jpg|Jpeg|*.jpeg|Gif|*.gif|Tiff|*.tiff|Png|*.p' +
      'ng|Icon|*.ico'
    Left = 96
    Top = 344
  end
end
