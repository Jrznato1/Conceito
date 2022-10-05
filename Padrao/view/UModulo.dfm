object Modulo: TModulo
  OldCreateOrder = False
  Height = 320
  Width = 439
  object ADOConnection1: TADOConnection
    Left = 80
    Top = 32
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Programas\SQLite\test.db'
      'User_Name=teste'
      'Password=teste'
      'DriverID=SQLite')
    Left = 80
    Top = 104
  end
  object FDConnection2: TFDConnection
    Left = 144
    Top = 192
  end
end
