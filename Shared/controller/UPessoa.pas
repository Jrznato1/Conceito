unit UPessoa;

interface

uses
  UTipos,
  UConsts;

type
  TObito = class;
  TCadastro = class;
  TRg = class;
  TEndereco = class;

  TPessoa = class
  private
    FCodigo: Integer;
    FTipo: TTipoPessoa;
    FDataNascimento: TDateTime;
    FCodigobarras: string;
    FObito: TObito;
    FInclusao: TCadastro;
    FNome: string;
    FCpf: string;
    FRg: TRg;
    FNomePai: string;
    FNomeMae: string;

    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
  end;

  TObito = class
  private
    FData: TDatetime;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
  end;

  TCadastro = class
  private
    FUsuarioCodigo: integer;
    FData: TDatetime;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
  end;

  TRg = class
  private
    FNumero: string;
    FDigito: string;
    FDataEmissao: TDateTime;
    FOrgaoEmissor: Integer;
    FEstado: string;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
  end;

  TEndereco = class
  private
    FCodigo: Integer;
    FTipo: Integer;
    FNumero: string;
    FComplemento: string;

    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
  end;

implementation

end.
